# Troubleshooting

## Launch button does nothing / Trk light stays off

1. Open the Max Console for details (device wrench icon → Console icon
   in the right sidebar)
2. `找不到 Tracker` ("Tracker not found"): the device (and
   gc_launcher.js) must sit inside the project's `max-device/` folder,
   and the project root must contain `.venv` (see the installation doc);
   or build a standalone version first with `build/build_macos.sh`
3. `node.script: no such object`: your Live/Max version is too old
   (Node for Max ships with Live 10.1+); start the Tracker manually
   instead
4. The process exits immediately after Launch: usually camera permission
   or the camera is in use — the Console shows the specific error with a
   `[tracker]` prefix
5. In any case, starting `run_tracker.command` manually is an equivalent
   fallback

## The program opens the iPhone / phone camera

macOS Continuity Camera puts the iPhone into the camera list, and it
often takes index 0. The current version automatically skips iPhones and
virtual cameras by default and prefers the built-in camera (on startup
the terminal prints the device table and the device actually chosen).

If it still opens the phone:

1. Run `--list-cameras` to see the device table
2. Force a device with `--camera-name "FaceTime"` (or whichever name you
   want from the table)
3. You can also disable it on the iPhone: Settings → General → AirPlay &
   Continuity → Continuity Camera

Conversely, to use the iPhone as the input: `--camera-name iPhone` (or
the phone's name), or set `avoid_continuity_camera` to `false` in
config.json.

## Camera will not open

**Symptom**: `[camera] 错误：无法打开任何摄像头` ("could not open any camera")

1. **macOS permission**: System Settings → Privacy & Security → Camera →
   allow "Terminal" (or whichever terminal app you use), then restart
   the terminal and try again
2. **In use by another program**: close Zoom / FaceTime / browser tabs, etc.
3. **External camera**: try another index with `--camera 1` or `--camera 2`
4. **Windows**: Settings → Privacy → Camera → allow desktop apps to
   access the camera

## `AttributeError: module 'mediapipe' has no attribute 'solutions'`

You are running old code or an old tutorial example. This project uses
the MediaPipe **Tasks API** (`mp.solutions` was removed after 0.10.2x) —
make sure you are running this repository's `gesture-tracker/main.py`.

## Model download fails

**Symptom**: `模型下载失败 ...` ("model download failed")

Download
`https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task`
manually and place it at `gesture-tracker/assets/hand_landmarker.task`.

## MediaPipe fails to install / version not found

- Make sure the Python version is **3.9–3.12**: `python3 --version`
  (there are no MediaPipe wheels for 3.13+ yet)
- Apple Silicon requires macOS 11+

## Max receives no data

1. Run `python tests/osc_monitor.py --seconds 5` first — if it receives
   data, the problem is on the Max side; if not, the Tracker is not
   sending
2. Check the ports match: the Tracker's `--port` equals the Max
   `udpreceive` argument
3. Port in use: `udpreceive` reports
   `udpreceive: can't bind to port` in the Max Console → the port is
   held by another program (or another device instance); switch ports
4. Firewall: local 127.0.0.1 traffic is normally unaffected; if you use
   a LAN IP you need to allow it

## OSC port already in use (Tracker side)

The Tracker is a UDP **sender** — it binds no receive port and cannot
itself hit a port conflict. Conflicts only happen on the receiving side
(Max / osc_monitor); just switch ports.

## Jittery / oversensitive tracking

- Increase smoothing: `--smoothing 200`
- Increase the dead zone: `--deadzone 0.02`
- Poor lighting noticeably hurts MediaPipe accuracy: add frontal light
- 0.5–1.5 m from the camera with the palm facing it works best

## False fist triggers

Edit `config.json`: lower `fist_enter_threshold` (e.g. 0.20) and raise
`fist_exit_threshold` (e.g. 0.45) to widen the hysteresis band.

## Hand-distance range too small / too large

Adjust `distance_near` / `distance_far` in `config.json`: bring your
hands together and read the raw distance in the preview window; typical
ranges are near 1.0–1.5, far 5.0–9.0.

## Low frame rate

- Turn off the preview window with `--no-preview`
- Lower the resolution: `--width 480 --height 360`
- Close other CPU-heavy programs; the MediaPipe hand model usually runs
  at 60+ FPS on a CPU — the bottleneck is most often the camera itself

## Left/right hand labels are swapped

Make sure `flip_horizontal` is `true` in `config.json` (the default).
Disabling mirroring makes MediaPipe's left/right-hand decision opposite
to the user's point of view.
