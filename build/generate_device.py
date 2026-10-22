"""
generate_device.py — programmatically generate the Gesture Control device

The device contains 250+ objects, so hand-writing the maxpat JSON is
unmaintainable. This script describes the whole device in code (objects,
patch cords, Presentation layout), generates
max-device/Gesture Control.maxpat, calls make_amxd to package the .amxd,
and copies javascript/gesture_mapper.js next to the device (required by
Max's search path).

Wiring principles (keeping the Patch view tidy):
  * Every long-distance / one-to-many connection uses send/receive
    (the "---" prefix makes M4L localize them per device instance, so
    multiple instances never cross wires):
      ---g1..---g9   the nine gesture values (after clip)
      ---wbang       bang that re-feeds widget values on load
      ---restore     pattr restore bang
      ---jscmd       every command sent to the js (map/unmap/enable/restore/init)
      ---slot1..8    each slot's js output
  * The Patch view is split into 5 commented sections: OSC receive /
    gesture parameters / initialization / js mapping hub /
    8 mapping-slot blocks (4 columns × 2 rows)

Usage: python build/generate_device.py
"""

import json
import os
import shutil
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from make_amxd import make_amxd  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_MAXPAT = os.path.join(ROOT, "max-device", "Gesture Control.maxpat")
OUT_AMXD = os.path.join(ROOT, "max-device", "Gesture Control.amxd")
JS_SRC = os.path.join(ROOT, "max-device", "javascript", "gesture_mapper.js")
JS_DST = os.path.join(ROOT, "max-device", "gesture_mapper.js")
LAUNCHER_SRC = os.path.join(ROOT, "max-device", "javascript", "gc_launcher.js")
LAUNCHER_DST = os.path.join(ROOT, "max-device", "gc_launcher.js")

# The 9 gesture channels: <label, parameter long name, short name, is-switch,
# parameter object varname prefix, OSC address>
# New channels may only be appended at the end: the mapping slots' Src menu
# is saved by index, so inserting in the middle would scramble the gesture
# sources of slots in already-saved Live Sets.
CHANNELS = [
    ("L Open", "Left Open", "L Open", False, "LO", "/gesture/left/openness"),
    ("L Fist", "Left Fist", "L Fist", True, "LF", "/gesture/left/fist"),
    ("R Open", "Right Open", "R Open", False, "RO", "/gesture/right/openness"),
    ("R Fist", "Right Fist", "R Fist", True, "RF", "/gesture/right/fist"),
    ("H Dist", "Hand Distance", "H Dist", False, "HD", "/gesture/hands/distance"),
    ("L X", "Left X", "L X", False, "LX", "/gesture/left/x"),
    ("L Y", "Left Y", "L Y", False, "LY", "/gesture/left/y"),
    ("R X", "Right X", "R X", False, "RX", "/gesture/right/x"),
    ("R Y", "Right Y", "R Y", False, "RY", "/gesture/right/y"),
]

# Mapping slots
SLOT_COUNT = 8
SLOT_DEFAULT_SOURCE = [0, 1, 2, 3, 4, 0, 2, 4]  # the first 5 slots default to the 5 gestures

# route address table: gesture channels first, then the status addresses;
# outlet number = list index, and the last outlet carries unmatched messages
OSC_ADDRS = [c[5] for c in CHANNELS] + [
    "/gesture/left/detected", "/gesture/right/detected",
    "/gesture/camera/status"]
OSC_ROUTE = "route " + " ".join(OSC_ADDRS)
ROUTE_UNMATCHED = len(OSC_ADDRS)

# Mapping formula applying Min/Max/Invert to the gesture value:
# out = min + (x + inv*(1-2x)) * (max-min)
EXPR = "expr $f2 + ($f1 + $f4 * (1. - 2. * $f1)) * ($f3 - $f2)"

# Settable range of a slot's Min/Max: a "fraction of the target parameter's
# range" (0..1). live.remote~ expects the target parameter's raw range
# (Pan is -1..1, LFO Depth 0..100, frequencies in Hz), so the js reads the
# target's min/max on Map/restore and sends it back to the patch (the range
# message); the fraction from expr is scaled linearly to the raw range
# before it reaches live.remote~.
MAP_RANGE = (0.0, 1.0)
SCALE_EXPR = "expr $f2 + $f1 * ($f3 - $f2)"   # $f1 fraction, $f2 target min, $f3 target max

# ================= Dark theme palette (presentation) =================
COL_BG = [0.12, 0.12, 0.12, 1.0]        # device background
COL_PANEL = [0.16, 0.16, 0.16, 1.0]     # section panels
COL_TEXT = [0.82, 0.82, 0.82, 1.0]      # regular text
COL_DIM = [0.52, 0.52, 0.52, 1.0]       # secondary text (table headers)
COL_ACCENT = [0.98, 0.65, 0.12, 1.0]    # title accent (orange)
COL_TARGET = [0.55, 0.78, 0.95, 1.0]    # mapping target name (blue)
LED_ON = [0.30, 0.85, 0.40, 1.0]        # indicator on (green)
LED_OFF = [0.27, 0.27, 0.27, 1.0]       # indicator off (dark gray)
BTN_STYLE = dict(bgcolor=[0.22, 0.22, 0.22, 1.0],
                 bgoncolor=[0.98, 0.65, 0.12, 1.0],
                 textcolor=[0.88, 0.88, 0.88, 1.0],
                 textoncolor=[0.10, 0.10, 0.10, 1.0],
                 bordercolor=[0.38, 0.38, 0.38, 1.0], rounded=8.0)
NUM_STYLE = dict(bgcolor=[0.18, 0.18, 0.18, 1.0],
                 textcolor=[0.90, 0.90, 0.90, 1.0])


def panel_attrs(color, rounded=0):
    """Fill attributes for a panel object (writes both the new and old attribute names for compatibility)."""
    return dict(mode=0, background=1, border=0, rounded=rounded,
                bgcolor=color, bgfillcolor_type="color",
                bgfillcolor_color=color, bgfillcolor_angle=270.0,
                bgfillcolor_proportion=0.5, bgfillcolor_autogradient=0.0)


class Patch:
    """maxpat builder: box() adds an object and returns its id, line() connects them."""

    def __init__(self):
        self.boxes = []
        self.lines = []
        self._n = 0

    def box(self, maxclass, rect, text=None, pres=None, outlets=None,
            inlets=1, **extra):
        self._n += 1
        oid = "obj-%d" % self._n
        b = {"id": oid, "maxclass": maxclass, "numinlets": inlets,
             "numoutlets": len(outlets) if outlets else 0,
             "patching_rect": [float(v) for v in rect]}
        if outlets:
            b["outlettype"] = outlets
        if text is not None:
            b["text"] = text
        if pres is not None:
            b["presentation"] = 1
            b["presentation_rect"] = [float(v) for v in pres]
        b.update(extra)
        self.boxes.append({"box": b})
        return oid

    def line(self, src, outlet, dst, inlet=0):
        self.lines.append({"patchline": {"source": [src, outlet],
                                         "destination": [dst, inlet]}})

    def comment(self, rect, text, pres=None, fontsize=None, bold=False,
                **extra):
        if fontsize:
            extra["fontsize"] = float(fontsize)
        if bold:
            extra["fontface"] = 1
        return self.box("comment", rect, text=text, pres=pres, **extra)

    def send(self, name, rect):
        return self.box("newobj", rect, text="s " + name)

    def recv(self, name, rect):
        return self.box("newobj", rect, text="r " + name,
                        outlets=[""], inlets=0)


def live_param(longname, shortname, ptype, mmin, mmax, initial,
               unitstyle=None, invisible=None, enum=None):
    """Build the saved_attribute_attributes for a live.* object."""
    v = {"parameter_longname": longname, "parameter_shortname": shortname,
         "parameter_type": ptype, "parameter_mmin": mmin,
         "parameter_mmax": mmax, "parameter_initial": [initial],
         "parameter_initial_enable": 1}
    if unitstyle is not None:
        v["parameter_unitstyle"] = unitstyle
    if invisible is not None:
        v["parameter_invisible"] = invisible
    if enum is not None:
        v["parameter_enum"] = enum
        del v["parameter_mmin"]
    return {"valueof": v}


def build():
    p = Patch()
    G = ["---g%d" % (i + 1) for i in range(len(CHANNELS))]  # gesture value buses

    # Dark background and section panels (background=1: bottom layer, ignores clicks)
    p.box("panel", [1500, 700, 100, 60], pres=[0, 0, 1116, 169],
          **panel_attrs(COL_BG))
    p.box("panel", [1500, 770, 100, 40], pres=[2, 26, 148, 102],
          **panel_attrs(COL_PANEL, rounded=6))
    p.box("panel", [1500, 820, 100, 40], pres=[152, 24, 856, 120],
          **panel_attrs(COL_PANEL, rounded=6))
    p.box("panel", [1500, 870, 100, 40], pres=[1010, 26, 104, 102],
          **panel_attrs(COL_PANEL, rounded=6))  # palm X/Y

    # ================= Section 1: OSC receive / status watchdog =================
    p.comment([30, 20, 560, 20], "1) OSC 接收 → route 分发 → clip 限幅 → "
              "[s ---g1..%d] 手势值总线" % len(CHANNELS), fontsize=12,
              bold=True)
    p.comment([30, 42, 140, 20], "Gesture Control",
              pres=[6, 3, 106, 18], fontsize=12, bold=True,
              textcolor=COL_ACCENT)

    # Port (a live parameter, saved with the Set) → udpreceive
    p.comment([200, 42, 34, 18], "Port", pres=[112, 5, 28, 16], fontsize=10,
              textcolor=COL_TEXT)
    port = p.box("live.numbox", [240, 42, 50, 15], pres=[140, 4, 46, 16],
                 outlets=["", "float"], parameter_enable=1,
                 varname="osc_port",
                 saved_attribute_attributes=live_param(
                     "OSC Port", "Port", 0, 1024.0, 65535.0, 9000.0,
                     unitstyle=0, invisible=1))
    r_wb_port = p.recv("---wbang", [300, 42, 70, 20])
    port_i = p.box("newobj", [240, 68, 32, 22], text="t i", outlets=["int"])
    # Only send port to udpreceive when the port actually changed (see the
    # node.script comment below for why): identical values re-fed on load or
    # Launch will not make it rebuild the socket
    port_chg = p.box("newobj", [240, 94, 80, 22], text="change 9000",
                     outlets=["int", "int", "int"], inlets=2)
    port_pre = p.box("newobj", [240, 120, 85, 22], text="prepend port",
                     outlets=[""])
    p.line(r_wb_port, 0, port, 0)
    p.line(port, 0, port_i, 0)
    p.line(port_i, 0, port_chg, 0)
    p.line(port_chg, 0, port_pre, 0)

    # node.script must be instantiated before udpreceive: the Node for Max
    # process manager (N4M PM) is forked from the Live process when
    # node.script is created and inherits every socket open at that moment.
    # If udpreceive creates its socket first, the PM gets a copy; later,
    # when udpreceive rebinds on a port message, the old socket is still
    # held by the PM and keeps stealing packets on that port — Live's
    # udpreceive then receives nothing. Max instantiates boxes in order,
    # so node.script is created first here.
    node = p.box("newobj", [700, 76, 170, 22],
                 text="node.script gc_launcher.js", outlets=["", ""])

    udp = p.box("newobj", [30, 130, 110, 22], text="udpreceive 9000",
                outlets=[""])
    route = p.box("newobj", [30, 175, 780, 22], text=OSC_ROUTE,
                  outlets=[""] * (ROUTE_UNMATCHED + 1))
    p.line(port_pre, 0, udp, 0)
    p.line(udp, 0, route, 0)

    # Gesture channels: clip → bus send (+ direct wiring to the approach-A
    # parameter objects, see section 2)
    clips = []
    for ci, (label, longname, _s, is_switch, _p, addr) in enumerate(CHANNELS):
        x = 30 + ci * 90
        text = "clip 0 1" if is_switch else "clip 0. 1."
        clip = p.box("newobj", [x, 230, 60, 22], text=text,
                     outlets=[""], inlets=3)
        p.line(route, OSC_ADDRS.index(addr), clip, 0)
        p.line(clip, 0, p.send(G[ci], [x, 262, 60, 20]), 0)
        clips.append(clip)

    # OSC activity watchdog: 1.5 s without data → OSC/L/R lights go off
    tb = p.box("newobj", [850, 130, 40, 22], text="t b b",
               outlets=["bang", "bang"])
    dly = p.box("newobj", [850, 162, 75, 22], text="delay 1500",
                outlets=["bang"], inlets=2)
    m1 = p.box("message", [940, 162, 30, 22], text="1", inlets=2,
               outlets=[""])
    m0 = p.box("message", [850, 196, 30, 22], text="0", inlets=2,
               outlets=[""])
    leds = {}
    led_defs = [("osc", 940, 196, 196, "OSC", 30),
                ("cam", 1060, 300, 248, "Cam", 32),
                ("left", 1150, 130, 300, "L", 16),
                ("right", 1150, 165, 336, "R", 16)]
    for key, lx, ly, prx, label, lw in led_defs:
        leds[key] = p.box("led", [lx, ly, 12, 12], pres=[prx, 5, 12, 12],
                          outlets=["int"], parameter_enable=0,
                          varname="led_" + key,
                          oncolor=LED_ON, offcolor=LED_OFF)
        p.comment([lx + 16, ly - 2, 40, 16], label,
                  pres=[prx + 14, 4, lw + 14, 16], fontsize=10,
                  textcolor=COL_TEXT)
    p.line(udp, 0, tb, 0)
    p.line(tb, 0, dly, 0)
    p.line(tb, 1, m1, 0)
    p.line(m1, 0, leds["osc"], 0)
    p.line(dly, 0, m0, 0)
    for k in ("osc", "left", "right"):
        p.line(m0, 0, leds[k], 0)
    p.line(route, OSC_ADDRS.index("/gesture/left/detected"), leds["left"], 0)
    p.line(route, OSC_ADDRS.index("/gesture/right/detected"),
           leds["right"], 0)

    # Camera heartbeat watchdog: status==1 → on; 1.6 s without a heartbeat → off
    cam_t = p.box("newobj", [1000, 230, 40, 22], text="t b i",
                  outlets=["bang", "int"])
    cam_dly = p.box("newobj", [1000, 262, 75, 22], text="delay 1600",
                    outlets=["bang"], inlets=2)
    cam_m0 = p.box("message", [1000, 296, 30, 22], text="0", inlets=2,
                   outlets=[""])
    cam_eq = p.box("newobj", [1090, 262, 40, 22], text="== 1",
                   outlets=["int"], inlets=2)
    p.line(route, OSC_ADDRS.index("/gesture/camera/status"), cam_t, 0)
    p.line(cam_t, 0, cam_dly, 0)
    p.line(cam_t, 1, cam_eq, 0)
    p.line(cam_eq, 0, leds["cam"], 0)
    p.line(cam_dly, 0, cam_m0, 0)
    p.line(cam_m0, 0, leds["cam"], 0)

    unmatched = p.box("newobj", [1150, 230, 130, 22],
                      text="print GC-unmatched")
    p.line(route, ROUTE_UNMATCHED, unmatched, 0)

    # MIDI pass-through
    midiin = p.box("newobj", [1300, 130, 50, 22], text="midiin",
                   outlets=["int"])
    midiout = p.box("newobj", [1300, 165, 55, 22], text="midiout")
    p.line(midiin, 0, midiout, 0)

    # ===== Section 2: gesture parameters (approach A, automatable) =====
    p.comment([30, 300, 560, 20], "2) 方式A：live.* 参数（自动化 / 保存 / "
              "Push），由 clip 直接驱动", fontsize=12, bold=True)
    dial_pres = {"Left Open": [6, 30, 44, 48],
                 "Hand Distance": [54, 30, 44, 48],
                 "Right Open": [102, 30, 44, 48],
                 # Right-side X/Y panel: left hand on the top row, right hand below
                 "Left X": [1014, 28, 44, 48], "Left Y": [1064, 28, 44, 48],
                 "Right X": [1014, 78, 44, 48], "Right Y": [1064, 78, 44, 48]}
    tog_pres = {"Left Fist": [14, 88, 15, 15], "Right Fist": [110, 88, 15, 15]}
    tog_label_pres = {"Left Fist": [2, 106, 44, 16],
                      "Right Fist": [98, 106, 44, 16]}
    for ci, (label, longname, shortname, is_switch, prefix, _a) in enumerate(CHANNELS):
        x = 30 + ci * 90
        if is_switch:
            obj = p.box("live.toggle", [x, 330, 18, 18],
                        pres=tog_pres[longname], outlets=[""],
                        parameter_enable=1, varname=prefix + "_param",
                        saved_attribute_attributes=live_param(
                            longname, shortname, 2, 0, 1, 0,
                            enum=["off", "on"]))
            p.comment([x, 352, 44, 16], shortname,
                      pres=tog_label_pres[longname], fontsize=9,
                      textcolor=COL_TEXT)
        else:
            obj = p.box("live.dial", [x, 330, 44, 48],
                        pres=dial_pres[longname], outlets=["", "float"],
                        parameter_enable=1, varname=prefix + "_param",
                        saved_attribute_attributes=live_param(
                            longname, shortname, 0, 0.0, 1.0, 0.0,
                            unitstyle=1))
        p.line(clips[ci], 0, obj, 0)

    # ================= Section 3: initialization cascade =================
    p.comment([1250, 20, 420, 34], "3) 初始化：设备就绪 → js init → "
              "控件值回灌(---wbang) → pattr 恢复(---restore)",
              fontsize=12, bold=True)
    thisdev = p.box("live.thisdevice", [1250, 60, 100, 22],
                    outlets=["bang", "int", "int"])
    defer = p.box("newobj", [1250, 92, 60, 22], text="deferlow",
                  outlets=[""])
    init_t = p.box("newobj", [1250, 124, 60, 22], text="t b b b",
                   outlets=["bang", "bang", "bang"])
    m_init = p.box("message", [1390, 156, 40, 22], text="init", inlets=2,
                   outlets=[""])
    s_init = p.send("---jscmd", [1390, 188, 80, 20])
    s_wbang = p.send("---wbang", [1310, 156, 80, 20])
    res_dly = p.box("newobj", [1230, 156, 60, 22], text="del 300",
                    outlets=["bang"], inlets=2)
    s_restore = p.send("---restore", [1230, 188, 90, 20])
    p.line(thisdev, 0, defer, 0)
    p.line(defer, 0, init_t, 0)
    p.line(init_t, 2, m_init, 0)
    p.line(m_init, 0, s_init, 0)
    p.line(init_t, 1, s_wbang, 0)
    p.line(init_t, 0, res_dly, 0)
    p.line(res_dly, 0, s_restore, 0)

    # ================= Section 4: js mapping hub =================
    p.comment([1250, 240, 420, 20], "4) js 映射管理：命令入(---jscmd)，"
              "各槽输出(---slot1..8)", fontsize=12, bold=True)
    r_jscmd = p.recv("---jscmd", [1250, 268, 80, 20])
    js = p.box("newobj", [1250, 300, 160, 22], text="js gesture_mapper.js",
               outlets=[""] * SLOT_COUNT)
    p.line(r_jscmd, 0, js, 0)
    for si in range(SLOT_COUNT):
        s_slot = p.send("---slot%d" % (si + 1),
                        [1250 + (si % 4) * 110, 340 + (si // 4) * 30, 90, 20])
        p.line(js, si, s_slot, 0)

    # ========== Section 6: Tracker launcher (Node for Max) ==========
    # Launch/Stop start the local Python Tracker from inside the device;
    # when it cannot be found, the user is told to start it manually
    p.comment([440, 20, 460, 20], "6) Tracker 启动器：node.script 启动/停止 "
              "Python 进程，日志转发 Max Console", fontsize=12, bold=True)
    # the node object was created before section 1 (instantiation order); only wiring here
    m_script = p.box("message", [700, 44, 70, 22], text="script start",
                     inlets=2, outlets=[""])
    p.line(m_script, 0, node, 0)
    p.line(init_t, 2, m_script, 0)

    pre_pnode = p.box("newobj", [340, 94, 90, 22], text="prepend port",
                      outlets=[""])
    p.line(port_i, 0, pre_pnode, 0)
    p.line(pre_pnode, 0, node, 0)

    prev_tg = p.box("live.toggle", [440, 42, 15, 15], pres=[526, 5, 12, 12],
                    outlets=[""], parameter_enable=1, varname="trk_preview",
                    saved_attribute_attributes=live_param(
                        "Tracker Preview", "Prev", 2, 0, 1, 1,
                        invisible=1, enum=["off", "on"]))
    p.comment([460, 40, 40, 16], "Prev", pres=[540, 4, 34, 16],
              fontsize=10, textcolor=COL_TEXT)
    pre_prev = p.box("newobj", [440, 94, 100, 22], text="prepend preview",
                     outlets=[""])
    p.line(prev_tg, 0, pre_prev, 0)
    p.line(pre_prev, 0, node, 0)

    # Launch: re-feed port/preview first (so launch arguments are current), then send launch
    launch_btn = p.box("textbutton", [560, 42, 48, 18],
                       pres=[430, 4, 46, 16], outlets=["", "", ""],
                       text="Launch", **BTN_STYLE)
    stop_btn = p.box("textbutton", [614, 42, 40, 18], pres=[480, 4, 40, 16],
                     outlets=["", "", ""], text="Stop", **BTN_STYLE)
    lt = p.box("newobj", [560, 68, 60, 22], text="t b b b",
               outlets=["bang", "bang", "bang"])
    m_launch = p.box("message", [560, 96, 50, 22], text="launch", inlets=2,
                     outlets=[""])
    m_stop = p.box("message", [620, 96, 40, 22], text="stop", inlets=2,
                   outlets=[""])
    p.line(launch_btn, 0, lt, 0)
    p.line(lt, 2, port, 0)
    p.line(lt, 1, prev_tg, 0)
    p.line(lt, 0, m_launch, 0)
    p.line(m_launch, 0, node, 0)
    p.line(stop_btn, 0, m_stop, 0)
    p.line(m_stop, 0, node, 0)

    rt_node = p.box("newobj", [700, 108, 90, 22], text="route running",
                    outlets=["", ""])
    led_trk = p.box("led", [800, 108, 12, 12], pres=[382, 5, 12, 12],
                    outlets=["int"], parameter_enable=0, varname="led_trk",
                    oncolor=LED_ON, offcolor=LED_OFF)
    p.comment([816, 106, 40, 16], "Trk", pres=[396, 4, 30, 16],
              fontsize=10, textcolor=COL_TEXT)
    p.line(node, 0, rt_node, 0)
    p.line(rt_node, 0, led_trk, 0)

    # ========== Section 5: the 8 mapping slots (4 columns × 2 rows) ==========
    p.comment([30, 420, 900, 20], "5) 映射槽：r ---g* → switch(Src 选源) → "
              "expr(Min/Max/Inv) → line(Time) → expr(目标 min/max 缩放) → "
              "live.remote~；js 经 r ---slotN 控制绑定/量程/显示",
              fontsize=12, bold=True)

    SOURCE_ITEMS = [c[0] for c in CHANNELS]

    # Mapping matrix headers (one copy per column)
    header_cols = [("Src", 0, 50), ("Value", 56, 38), ("Map", 96, 30),
                   ("Target", 146, 60), ("Min", 264, 32), ("Max", 304, 32),
                   ("Inv", 344, 24), ("Time", 362, 38), ("On", 402, 22)]
    for col in range(2):
        xbase = 158 + col * 430
        for hi, (text, hx, hw) in enumerate(header_cols):
            p.comment([1450 + col * 200, 380 + hi * 20, 60, 14], text,
                      pres=[xbase + hx, 26, hw, 14], fontsize=9,
                      textcolor=COL_DIM)

    widget_ids = []
    pattr_ids = []
    for si in range(SLOT_COUNT):
        n = si + 1
        col, row = si // 4, si % 4
        xbase = 158 + col * 430   # presentation column base
        y = 42 + row * 25         # presentation row
        sx = 30 + (si % 4) * 350  # patching slot-block column
        sy = 480 + (si // 4) * 500
        pfx = "S%d" % n

        p.comment([sx, sy - 24, 320, 18], "—— Slot %d ——" % n, fontsize=11,
                  bold=True)

        # ---- UI widgets (two rows)
        menu = p.box("live.menu", [sx, sy, 50, 15],
                     pres=[xbase, y + 1, 50, 15], outlets=["", "", ""],
                     parameter_enable=1, varname=pfx + "_source",
                     saved_attribute_attributes=live_param(
                         pfx + " Source", "Src", 2, 0, len(SOURCE_ITEMS) - 1,
                         SLOT_DEFAULT_SOURCE[si], invisible=1,
                         enum=SOURCE_ITEMS))
        out_num = p.box("flonum", [sx + 58, sy, 46, 22],
                        pres=[xbase + 56, y, 38, 20], outlets=["", "bang"],
                        cantchange=1, numdecimalplaces=2, **NUM_STYLE)
        map_btn = p.box("textbutton", [sx + 112, sy, 36, 20],
                        pres=[xbase + 96, y, 30, 18], outlets=["", "", ""],
                        text="Map", **BTN_STYLE)
        un_btn = p.box("textbutton", [sx + 154, sy, 20, 20],
                       pres=[xbase + 128, y, 16, 18], outlets=["", "", ""],
                       text="x", **BTN_STYLE)
        target = p.comment([sx + 182, sy + 2, 140, 16], "--",
                           pres=[xbase + 146, y + 2, 114, 16], fontsize=10,
                           textcolor=COL_TARGET)
        # Min/Max number boxes widened to 38 so "-1.00" fits
        min_nb = p.box("live.numbox", [sx, sy + 28, 44, 15],
                       pres=[xbase + 264, y + 2, 38, 15],
                       outlets=["", "float"], parameter_enable=1,
                       varname=pfx + "_min",
                       saved_attribute_attributes=live_param(
                           pfx + " Min", "Min", 0, MAP_RANGE[0], MAP_RANGE[1],
                           0.0, unitstyle=1, invisible=1))
        max_nb = p.box("live.numbox", [sx + 50, sy + 28, 44, 15],
                       pres=[xbase + 304, y + 2, 38, 15],
                       outlets=["", "float"], parameter_enable=1,
                       varname=pfx + "_max",
                       saved_attribute_attributes=live_param(
                           pfx + " Max", "Max", 0, MAP_RANGE[0], MAP_RANGE[1],
                           1.0, unitstyle=1, invisible=1))
        inv_tg = p.box("live.toggle", [sx + 100, sy + 28, 15, 15],
                       pres=[xbase + 346, y + 3, 14, 14], outlets=[""],
                       parameter_enable=1, varname=pfx + "_invert",
                       saved_attribute_attributes=live_param(
                           pfx + " Invert", "Inv", 2, 0, 1, 0,
                           invisible=1, enum=["off", "on"]))
        smo_nb = p.box("live.numbox", [sx + 122, sy + 28, 44, 15],
                       pres=[xbase + 362, y + 2, 40, 15],
                       outlets=["", "float"], parameter_enable=1,
                       varname=pfx + "_smooth",
                       saved_attribute_attributes=live_param(
                           pfx + " Smooth", "Time", 0, 0.0, 1000.0, 100.0,
                           unitstyle=2, invisible=1))
        en_tg = p.box("live.toggle", [sx + 172, sy + 28, 15, 15],
                      pres=[xbase + 406, y + 3, 14, 14], outlets=[""],
                      parameter_enable=1, varname=pfx + "_enable",
                      saved_attribute_attributes=live_param(
                          pfx + " Enable", "On", 2, 0, 1, 1,
                          invisible=1, enum=["off", "on"]))
        r_wb = p.recv("---wbang", [sx + 196, sy + 28, 70, 20])
        for w in (menu, min_nb, max_nb, inv_tg, smo_nb, en_tg):
            p.line(r_wb, 0, w, 0)

        # ---- Left column: gesture value → switch → expr → pack → line → live.remote~
        # r ---gN objects, 5 per row; everything below shifts down by the extra rows (ly)
        rgs = []
        for k in range(len(CHANNELS)):
            rgs.append(p.recv(G[k], [sx + (k % 5) * 52,
                                     sy + 62 + (k // 5) * 26, 48, 20]))
        ly = sy + ((len(CHANNELS) - 1) // 5) * 26
        plus1 = p.box("newobj", [sx + 270, sy + 62, 34, 22], text="+ 1",
                      outlets=["int"], inlets=2)
        sw = p.box("newobj", [sx, ly + 94, 160, 22],
                   text="switch %d" % len(CHANNELS), outlets=[""],
                   inlets=len(CHANNELS) + 1)
        p.line(menu, 0, plus1, 0)
        p.line(plus1, 0, sw, 0)
        for k, rg in enumerate(rgs):
            p.line(rg, 0, sw, k + 1)
        expr = p.box("newobj", [sx, ly + 128, 150, 22], text=EXPR,
                     outlets=[""], inlets=4)
        pack = p.box("newobj", [sx, ly + 162, 80, 22],
                     text="pack 0. 100.", outlets=[""], inlets=2)
        line = p.box("newobj", [sx, ly + 196, 70, 22],
                     text="line 0. 20", outlets=["", "bang"], inlets=3)
        # fraction → target raw range (the two cold inlets on the right are filled by the js range message)
        scale = p.box("newobj", [sx, ly + 230, 160, 22], text=SCALE_EXPR,
                      outlets=[""], inlets=3)
        remote = p.box("newobj", [sx, ly + 264, 90, 22],
                       text="live.remote~", outlets=["", ""], inlets=2)
        p.line(sw, 0, expr, 0)
        p.line(min_nb, 0, expr, 1)
        p.line(max_nb, 0, expr, 2)
        p.line(inv_tg, 0, expr, 3)
        p.line(expr, 0, out_num, 0)
        p.line(expr, 0, pack, 0)
        p.line(smo_nb, 0, pack, 1)
        p.line(pack, 0, line, 0)
        p.line(line, 0, scale, 0)
        p.line(scale, 0, remote, 0)

        # ---- Right column: Map/Unmap/Enable commands → js; js output → bind/display/save
        m_map = p.box("message", [sx + 180, ly + 94, 56, 22],
                      text="map %d" % n, inlets=2, outlets=[""])
        m_un = p.box("message", [sx + 180, ly + 124, 66, 22],
                     text="unmap %d" % n, inlets=2, outlets=[""])
        m_en = p.box("message", [sx + 180, ly + 154, 86, 22],
                     text="enable %d $1" % n, inlets=2, outlets=[""])
        s_cmd = p.send("---jscmd", [sx + 180, ly + 186, 80, 20])
        p.line(map_btn, 0, m_map, 0)
        p.line(un_btn, 0, m_un, 0)
        p.line(en_tg, 0, m_en, 0)
        for m in (m_map, m_un, m_en):
            p.line(m, 0, s_cmd, 0)

        r_slot = p.recv("---slot%d" % n, [sx + 180, ly + 216, 70, 20])
        rt = p.box("newobj", [sx + 180, ly + 246, 170, 22],
                   text="route id display path range",
                   outlets=["", "", "", "", ""])
        rng = p.box("newobj", [sx + 350, ly + 278, 80, 22],
                    text="unpack 0. 1.", outlets=["float", "float"])
        p.line(rt, 3, rng, 0)
        p.line(rng, 0, scale, 1)
        p.line(rng, 1, scale, 2)
        pre_id = p.box("newobj", [sx + 180, ly + 278, 75, 22],
                       text="prepend id", outlets=[""])
        # the id bind message goes through deferlow to leave any notification / high-priority context
        dfl_id = p.box("newobj", [sx + 180, ly + 310, 60, 22],
                       text="deferlow", outlets=[""])
        pre_set = p.box("newobj", [sx + 262, ly + 278, 80, 22],
                        text="prepend set", outlets=[""])
        pat = p.box("newobj", [sx + 180, ly + 342, 88, 22],
                    text="pattr map%d" % n, outlets=["", "", ""], inlets=2,
                    varname="pattr_map%d" % n)
        r_res = p.recv("---restore", [sx + 276, ly + 310, 80, 20])
        pre_res = p.box("newobj", [sx + 180, ly + 374, 110, 22],
                        text="prepend restore %d" % n, outlets=[""])
        s_res_cmd = p.send("---jscmd", [sx + 180, ly + 406, 80, 20])
        p.line(r_slot, 0, rt, 0)
        p.line(rt, 0, pre_id, 0)
        p.line(pre_id, 0, dfl_id, 0)
        p.line(dfl_id, 0, remote, 1)
        p.line(rt, 1, pre_set, 0)
        p.line(pre_set, 0, target, 0)
        p.line(rt, 2, pat, 1)          # right inlet: save silently without triggering output
        p.line(r_res, 0, pat, 0)       # restore bang → pattr outputs the saved path
        p.line(pat, 0, pre_res, 0)
        p.line(pre_res, 0, s_res_cmd, 0)

        widget_ids += [menu, min_nb, max_nb, inv_tg, smo_nb, en_tg]
        pattr_ids.append(pat)

    return p


def patcher_dict(p: Patch) -> dict:
    return {"patcher": {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 5, "revision": 6,
                       "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [59.0, 106.0, 1500.0, 900.0],
        "openrect": [0.0, 0.0, 0.0, 169.0],
        "bglocked": 0,
        "openinpresentation": 1,
        "devicewidth": 0.0,
        "title": "Gesture Control",
        "default_fontsize": 12.0,
        "default_fontface": 0,
        "default_fontname": "Arial",
        "gridonopen": 1,
        "gridsize": [15.0, 15.0],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "boxes": p.boxes,
        "lines": p.lines,
        "dependency_cache": [],
        "latency": 0,
        "project": {
            "version": 1,
            "creationdate": 3590052786,
            "modificationdate": 3590052786,
            "viewrect": [0.0, 0.0, 300.0, 500.0],
            "autoorganize": 1,
            "hideprojectwindow": 1,
            "showdependencies": 1,
            "autolocalize": 0,
            "contents": {"patchers": {}},
            "layout": {},
            "searchpath": {},
            "detailsvisible": 0,
            "amxdtype": 1835887981,
            "readonly": 0,
            "devpathtype": 0,
            "devpath": ".",
            "sortmode": 0,
            "viewmode": 0,
        },
        "autosave": 0,
    }}


def main():
    patch = build()
    data = patcher_dict(patch)
    with open(OUT_MAXPAT, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=1, ensure_ascii=False)
    print("maxpat: %d boxes, %d lines → %s"
          % (len(patch.boxes), len(patch.lines), OUT_MAXPAT))
    for src, dst in ((JS_SRC, JS_DST), (LAUNCHER_SRC, LAUNCHER_DST)):
        shutil.copy(src, dst)
        print("js: %s" % dst)
    make_amxd(OUT_MAXPAT, OUT_AMXD, "midi")


if __name__ == "__main__":
    main()
