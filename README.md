# Gesture Control M4L

A Max for Live device that controls Ableton Live parameters with two-hand
gestures, using your computer's camera and MediaPipe hand tracking.

```
Camera → Python Tracker (MediaPipe) → OSC (UDP 127.0.0.1:9000)
       → Max for Live device → mappable / automatable Ableton Live parameters
```

Hand tracking runs in a standalone Python program **outside the Ableton
process**, so the computer-vision workload never blocks the audio thread,
and a Tracker crash cannot take Live down with it.

## Output parameters

| Parameter | Range | Description |
|---|---|---|
| Left Open | 0.0–1.0 | How far the left hand is open (continuous, combines all five fingers) |
| Left Fist | 0 / 1 | Left-hand fist (with hysteresis, no flicker at the threshold) |
| Right Open | 0.0–1.0 | How far the right hand is open |
| Right Fist | 0 / 1 | Right-hand fist |
| Hand Distance | 0.0–1.0 | Distance between the two palms (compensated for distance from the camera) |
| Left X / Left Y | 0.0–1.0 | Left palm position in the frame (x: left→right, y: bottom→top) |
| Right X / Right Y | 0.0–1.0 | Right palm position |

## OSC address table

Sent to `127.0.0.1:9000` by default (change with `--port` or `config.json`).

| Address | Type | Range |
|---|---|---|
| `/gesture/left/openness` | float | 0.0–1.0 |
| `/gesture/left/fist` | int | 0/1 |
| `/gesture/left/detected` | int | 0/1 |
| `/gesture/right/openness` | float | 0.0–1.0 |
| `/gesture/right/fist` | int | 0/1 |
| `/gesture/right/detected` | int | 0/1 |
| `/gesture/hands/distance` | float | 0.0–1.0 |
| `/gesture/left/x` | float | 0.0–1.0 (0 = frame left, 1 = right) |
| `/gesture/left/y` | float | 0.0–1.0 (0 = frame bottom, 1 = top) |
| `/gesture/right/x` | float | 0.0–1.0 |
| `/gesture/right/y` | float | 0.0–1.0 |
| `/gesture/camera/status` | int | 0 = stopped, 1 = running, 2 = error (0.5 s heartbeat) |

## Quick start

```bash
# 1. Install dependencies (requires Python 3.9–3.12; MediaPipe does not support 3.13+)
cd Gesture-Control-M4L
python3.11 -m venv .venv
.venv/bin/pip install -r gesture-tracker/requirements.txt
```

2. Drag `max-device/Gesture Control.amxd` onto a MIDI track in Live
  (keep it next to the two .js files in the same folder)
3. Click **Launch** on the device → the camera starts tracking and the
   indicator lights turn on
4. Click **Map** on a mapping slot → click any parameter in Live → the
   gesture now controls it

Manual / debug runs:

```bash
.venv/bin/python gesture-tracker/main.py               # manual start
.venv/bin/python gesture-tracker/main.py --test-signal # test signal, no camera
.venv/bin/python gesture-tracker/main.py --list-cameras # list cameras
```

See [docs/installation.md](docs/installation.md) and
[docs/usage.md](docs/usage.md) for details.

## Project structure

```
Gesture-Control-M4L/
├── README.md
├── LICENSE
├── docs/                     # installation / usage / mapping / troubleshooting
├── max-device/
│   ├── Gesture Control.amxd  # ready-to-load M4L device (script-generated)
│   ├── Gesture Control.maxpat # device source patch (view/edit in Max)
│   ├── gesture_mapper.js     # Live API mapping (copied from javascript/ at build time)
│   ├── gc_launcher.js        # Node for Max Tracker launcher (same as above)
│   ├── javascript/           # source files for the two .js scripts
│   ├── patchers/             # OSC Test Receiver (debugging tool)
│   └── presets/              # demo preset notes
├── gesture-tracker/          # Python MediaPipe Tracker
│   ├── main.py               # main entry point
│   ├── hand_tracker.py       # MediaPipe HandLandmarker wrapper
│   ├── gesture_analysis.py   # gesture geometry (pure functions, unit-testable)
│   ├── smoothing.py          # smoothing / hysteresis / hand-lost handling
│   ├── osc_sender.py         # OSC output
│   ├── preview.py            # preview window
│   ├── config.py             # configuration (config.json + command line)
│   ├── requirements.txt
│   └── assets/hand_landmarker.task   # official MediaPipe model (auto-downloaded on first run)
├── build/
│   ├── generate_device.py    # device generator (edit this, then regenerate the device)
│   ├── make_amxd.py          # maxpat → amxd packaging
│   ├── build_macos.sh        # PyInstaller → GestureTracker.app
│   ├── build_windows.bat     # PyInstaller → GestureTracker.exe
│   └── dist/                 # build artifacts (not committed)
└── tests/                    # unit tests + OSC integration test
```

Regenerate the device after editing it:

```bash
.venv/bin/python build/generate_device.py
```

## Development milestones

- [x] Stage 1: MediaPipe Tracker prototype (tracking / smoothing / OSC / preview)
- [x] Stage 2: Max OSC receive test patch
- [x] Stage 3: Max for Live device parameters (live.* / automation / save / .amxd generation)
- [x] Stage 4: Live API Map/Unmap (8-slot matrix / live.remote~ / path persistence)
- [x] Stage 5: dark Presentation UI
- [x] Stage 6: in-device Launch/Stop, macOS packaging, documentation

## License

MIT — see [LICENSE](LICENSE).
