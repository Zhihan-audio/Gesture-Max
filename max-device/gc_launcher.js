// gc_launcher.js — Node for Max: launch / stop the Gesture Tracker from inside the device
//
// Message protocol (from Max):
//   port <n>      — record the OSC port (passed to the Tracker as --port on launch)
//   preview <0/1> — record whether to show the preview window
//   launch        — start the Tracker (ignored if already running)
//   stop          — stop the Tracker (SIGINT for a graceful exit, force-kill after 3 s)
//
// Output (→ Max):
//   running <0/1> — Tracker process state (wired to the Trk indicator)
//
// The Tracker is located in this order (__dirname = this script's max-device/ folder):
//   1. the ../.venv virtual environment + ../gesture-tracker/main.py (development layout)
//   2. the packaged GestureTracker under ../build/dist (PyInstaller output)
// If neither exists, manual-launch instructions are posted to the Max Console.
//
// Note: copying the .amxd elsewhere on its own breaks these relative paths;
// in that case start the Tracker manually (run_tracker.command /
// run_tracker.bat) — OSC functionality is unaffected.

const path = require("path");
const fs = require("fs");
const { spawn } = require("child_process");
const Max = require("max-api");

let child = null;
let oscPort = 9000;
let showPreview = 1;

const ROOT = path.resolve(__dirname, "..");

function candidates() {
    if (process.platform === "win32") {
        return [
            { bin: path.join(ROOT, ".venv", "Scripts", "python.exe"),
              args: [path.join(ROOT, "gesture-tracker", "main.py")] },
            { bin: path.join(ROOT, "build", "dist", "GestureTracker",
                             "GestureTracker.exe"), args: [] },
        ];
    }
    return [
        { bin: path.join(ROOT, ".venv", "bin", "python"),
          args: [path.join(ROOT, "gesture-tracker", "main.py")] },
        { bin: path.join(ROOT, "build", "dist", "GestureTracker.app",
                         "Contents", "MacOS", "GestureTracker"), args: [] },
    ];
}

function setRunning(v) {
    Max.outlet("running", v ? 1 : 0);
}

Max.addHandler("port", (v) => {
    const n = Math.round(Number(v));
    if (n >= 1024 && n <= 65535) oscPort = n;
});

Max.addHandler("preview", (v) => {
    showPreview = Number(v) ? 1 : 0;
});

Max.addHandler("launch", () => {
    if (child) {
        Max.post("GestureTracker 已在运行 (pid " + child.pid + ")");
        return;
    }
    const found = candidates().find((c) => fs.existsSync(c.bin));
    if (!found) {
        Max.post("找不到 Tracker。请确认设备位于项目 max-device/ 目录内，"
            + "且已安装 .venv（见 docs/installation.md），"
            + "或改用 run_tracker.command 手动启动。", Max.POST_LEVELS.ERROR);
        setRunning(0);
        return;
    }
    const args = found.args.concat(["--port", String(oscPort)]);
    if (!showPreview) args.push("--no-preview");

    try {
        child = spawn(found.bin, args, {
            cwd: path.dirname(found.args[0] || found.bin),
            stdio: ["ignore", "pipe", "pipe"],
        });
    } catch (e) {
        Max.post("Tracker 启动失败: " + e.message, Max.POST_LEVELS.ERROR);
        child = null;
        setRunning(0);
        return;
    }

    Max.post("GestureTracker 已启动 (pid " + child.pid + ", port "
        + oscPort + (showPreview ? ", 预览开" : ", 预览关") + ")");
    setRunning(1);

    // Forward the Tracker's log to the Max Console (line by line, avoiding merged blank-line spam)
    const forward = (data, isErr) => {
        String(data).split("\n").forEach((ln) => {
            if (ln.trim()) {
                Max.post("[tracker] " + ln.trim(),
                    isErr ? Max.POST_LEVELS.WARN : Max.POST_LEVELS.INFO);
            }
        });
    };
    child.stdout.on("data", (d) => forward(d, false));
    child.stderr.on("data", (d) => forward(d, true));

    child.on("exit", (code) => {
        Max.post("GestureTracker 已退出 (code " + code + ")");
        child = null;
        setRunning(0);
    });
    child.on("error", (e) => {
        Max.post("Tracker 进程错误: " + e.message, Max.POST_LEVELS.ERROR);
        child = null;
        setRunning(0);
    });
});

Max.addHandler("stop", () => {
    if (!child) {
        setRunning(0);
        return;
    }
    const pid = child.pid;
    Max.post("正在停止 GestureTracker (pid " + pid + ") ...");
    // SIGINT → the Tracker runs its graceful cleanup (releases the camera, sends status=0)
    try { child.kill(process.platform === "win32" ? "SIGTERM" : "SIGINT"); }
    catch (e) { /* already exited */ }
    setTimeout(() => {
        if (child && child.pid === pid) {
            try { child.kill("SIGKILL"); } catch (e) { }
        }
    }, 3000);
});

// When the device is deleted or Live quits, make sure no orphan process keeps holding the camera
process.on("exit", () => {
    if (child) {
        try { child.kill("SIGKILL"); } catch (e) { }
    }
});
