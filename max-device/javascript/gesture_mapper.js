// gesture_mapper.js — Gesture Control M4L mapping manager (Live API)
//
// Responsibilities:
//   * Map: listen for the next parameter clicked/moved in Live and capture it as the mapping target
//   * Unmap: remove a mapping
//   * Enable: bind/unbind live.remote~ per slot (after unbinding, the user can operate the target manually)
//   * Restore: when the device reloads, restore mappings by canonical path; dead path → Missing Target
//
// Message protocol (inlet 0):
//   init                     — called after live.thisdevice finishes loading (initializes the Live API)
//   map <slot>               — start/cancel listening (slot 1-5; only one slot may listen at a time)
//   unmap <slot>             — remove that slot's mapping
//   enable <slot> <0/1>      — slot enable state (0 unbinds live.remote~)
//   restore <slot> <path>    — restore the saved target path from pattr
//
// Output (outlets 0-4 correspond to slots 1-5):
//   id <n>                   — sent to live.remote~'s right inlet (0 = unbind)
//   display <text>           — target name / status text (→ prepend set → comment)
//   path <symbol>            — canonical path (→ pattr right inlet, silent save)
//   range <min> <max>        — the target parameter's raw range (→ unpack → expr scaling)
//
// Note: Max's js engine is ES5 — no let/const/arrow functions.

autowatch = 1;
inlets = 1;
outlets = 8;

var NUM_SLOTS = 8;   // 8 general-purpose mapping slots (the Source menu picks the gesture)
var MAX_NAME_LEN = 26;

var slots = [];        // {id, path, name, enabled, missing}
var armedSlot = -1;    // the slot currently listening (1-5), -1 = none
var skipFirst = false; // skip the immediate callback for the currently selected parameter when the observer is created
var selObserver = null;
var devicePath = "";
var ready = false;

// Live API notification callbacks must not trigger changes to Live
// (binding live.remote~ there is rejected with "Changes cannot be
// triggered by notifications"). The capture action must be deferred
// past the notification stack with a Task.
var pendingSlot = 0;
var pendingId = 0;
var pendingPath = "";
var captureTask = null;

function newSlot() {
    return { id: 0, path: null, name: "", enabled: 1, missing: false,
             min: 0, max: 1 };
}

for (var i = 0; i < NUM_SLOTS; i++) {
    slots[i] = newSlot();
}

// ---------------- Initialization ----------------

function init() {
    try {
        var dev = new LiveAPI(null, "this_device");
        devicePath = String(dev.unquotedpath);
        ready = true;
        for (var n = 1; n <= NUM_SLOTS; n++) {
            emitRange(n);
            refresh(n);
        }
    } catch (e) {
        post("gesture_mapper: init 失败: " + e.message + "\n");
    }
}

// ---------------- Map / Unmap / Enable ----------------

function map(n) {
    if (!valid(n)) return;
    if (!ready) init();
    if (armedSlot === n) {       // clicking again = cancel listening
        disarm();
        refresh(n);
        return;
    }
    var prev = armedSlot;
    armedSlot = n;
    if (prev > 0) refresh(prev); // restore the display of the previously listening slot
    startObserver();
    refresh(n);
}

function unmap(n) {
    if (!valid(n)) return;
    if (armedSlot === n) disarm();
    slots[n - 1] = newSlot();
    slots[n - 1].enabled = currentEnabled(n);
    outlet(n - 1, "id", 0);
    outlet(n - 1, "path", "none");
    emitRange(n);
    refresh(n);
}

function enable(n, v) {
    if (!valid(n)) return;
    slots[n - 1].enabled = (v > 0) ? 1 : 0;
    syncBind(n);
    refresh(n);
}

function currentEnabled(n) {
    return slots[n - 1] ? slots[n - 1].enabled : 1;
}

// ---------------- Observing parameter selection in Live ----------------

function startObserver() {
    stopObserver();
    skipFirst = true;   // the observer fires immediately for the current selection; skip it
    try {
        selObserver = new LiveAPI(onSelected, "live_set view");
        selObserver.property = "selected_parameter";
    } catch (e) {
        post("gesture_mapper: 无法监听 selected_parameter: " + e.message + "\n");
        armedSlot = -1;
    }
}

function stopObserver() {
    if (selObserver) {
        try { selObserver.property = ""; } catch (e) { }
        selObserver = null;
    }
}

function disarm() {
    stopObserver();
    armedSlot = -1;
}

function onSelected(args) {
    if (armedSlot < 0) return;
    if (skipFirst) { skipFirst = false; return; }

    var id = extractId(args);
    if (!id) return;

    try {
        var p = new LiveAPI(null, "id " + id);
        if (!p || p.id == 0) return;
        if (String(p.type) !== "DeviceParameter") return;
        var path = String(p.unquotedpath);
        // Ignore this device's own parameters (including the Min/Max mapping widgets)
        if (devicePath && path.indexOf(devicePath) === 0) return;

        // Only record here; the actual capture/bind is deferred past the
        // notification stack (see the header comment)
        pendingSlot = armedSlot;
        pendingId = id;
        pendingPath = path;
        disarm();
        if (captureTask) captureTask.cancel();
        captureTask = new Task(doCapture);
        captureTask.schedule(1);
    } catch (e) {
        post("gesture_mapper: 捕获参数失败: " + e.message + "\n");
    }
}

function doCapture() {
    if (pendingSlot >= 1 && pendingId) {
        capture(pendingSlot, pendingId, pendingPath);
    }
    pendingSlot = 0;
    pendingId = 0;
    pendingPath = "";
}

function extractId(args) {
    // Observer callbacks look like ["selected_parameter", "id", 17] (possibly nested arrays)
    var flat = [];
    flattenInto(args, flat);
    for (var i = 0; i < flat.length - 1; i++) {
        if (flat[i] === "id") return parseInt(flat[i + 1]);
    }
    return 0;
}

function flattenInto(a, out) {
    for (var i = 0; i < a.length; i++) {
        if (a[i] instanceof Array) flattenInto(a[i], out);
        else out.push(a[i]);
    }
}

// ---------------- Creating / restoring mappings ----------------

function capture(n, id, path) {
    var s = slots[n - 1];
    s.id = id;
    s.path = path;
    s.name = describe(path);
    s.missing = false;
    try { readRange(new LiveAPI(null, "id " + id), s); }
    catch (e) { s.min = 0; s.max = 1; }
    outlet(n - 1, "path", path);
    emitRange(n);
    syncBind(n);
    refresh(n);
}

function restore(n, path) {
    if (!valid(n)) return;
    if (!ready) init();
    if (path === undefined || path === null) return;
    path = String(path);
    if (path === "none" || path === "" || path === "0") return;  // an empty pattr outputs 0

    var s = slots[n - 1];
    s.path = path;
    try {
        var p = new LiveAPI(null, path);
        if (p && p.id != 0 && String(p.type) === "DeviceParameter") {
            s.id = parseInt(p.id);
            s.name = describe(path);
            s.missing = false;
            readRange(p, s);
        } else {
            s.id = 0;
            s.missing = true;
            s.min = 0; s.max = 1;
        }
    } catch (e) {
        s.id = 0;
        s.missing = true;
        s.min = 0; s.max = 1;
    }
    emitRange(n);
    syncBind(n);
    refresh(n);
}

// ---------------- Target range ----------------
// live.remote~ expects values in the target parameter's raw range (Pan is
// -1..1, LFO Depth is 0..100, filter frequency is in Hz). A slot's Min/Max
// stay within 0..1 and express a "fraction of the target's range"; here we
// send the target's min/max back to the patch, where expr scales the
// fraction linearly to the raw range.

function readRange(api, s) {
    s.min = 0;
    s.max = 1;
    try {
        var mn = api.get("min");
        var mx = api.get("max");
        mn = parseFloat(mn instanceof Array ? mn[0] : mn);
        mx = parseFloat(mx instanceof Array ? mx[0] : mx);
        if (!isNaN(mn) && !isNaN(mx) && mx !== mn) {
            s.min = mn;
            s.max = mx;
        }
    } catch (e) { }
}

function emitRange(n) {
    var s = slots[n - 1];
    outlet(n - 1, "range", s.min, s.max);
}

function syncBind(n) {
    var s = slots[n - 1];
    var bind = (s.enabled && s.id && !s.missing) ? s.id : 0;
    outlet(n - 1, "id", bind);
}

// ---------------- Display ----------------

function describe(path) {
    // Build the "device name | parameter name" display text
    try {
        var p = new LiveAPI(null, path);
        var pname = String(p.get("name"));
        var devName = "";
        try {
            // canonical_parent returns ["id", N] (possibly nested); extract the number
            var parent = p.get("canonical_parent");
            var flat = [];
            flattenInto(parent instanceof Array ? parent : [parent], flat);
            var pid = 0;
            for (var i = 0; i < flat.length; i++) {
                if (flat[i] !== "id") { pid = parseInt(flat[i]); break; }
            }
            if (pid) {
                var d = new LiveAPI(null, "id " + pid);
                devName = String(d.get("name"));
            }
        } catch (e2) { }
        var label = devName ? (devName + " | " + pname) : pname;
        if (label.length > MAX_NAME_LEN) {
            label = label.substring(0, MAX_NAME_LEN - 1) + "…";
        }
        return label;
    } catch (e) {
        return "?";
    }
}

function refresh(n) {
    var s = slots[n - 1];
    var text;
    if (armedSlot === n) text = ">> click a param...";
    else if (s.missing) text = "Missing Target";
    else if (s.id) text = s.name + (s.enabled ? "" : " (off)");
    else text = "--";
    outlet(n - 1, "display", text);
}

function valid(n) {
    if (n >= 1 && n <= NUM_SLOTS) return true;
    post("gesture_mapper: 非法槽编号 " + n + "\n");
    return false;
}
