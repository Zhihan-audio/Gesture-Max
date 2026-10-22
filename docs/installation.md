# Installation

## Requirements

- macOS 11+ (Apple Silicon / Intel) or Windows 10/11
- **Python 3.9 – 3.12** (MediaPipe does not support 3.13+ yet)
- Ableton Live 11/12 Suite (or Live + Max for Live)
- A working camera

## 1. Install the Python Tracker

```bash
cd Gesture-Control-M4L

# Create a virtual environment (replace python3.11 with any 3.9–3.12 version on your machine)
python3.11 -m venv .venv

# Install dependencies (mediapipe / opencv / python-osc / numpy)
.venv/bin/pip install -r gesture-tracker/requirements.txt
```

On Windows:

```bat
py -3.11 -m venv .venv
.venv\Scripts\pip install -r gesture-tracker\requirements.txt
```

On the first Tracker run, if `gesture-tracker/assets/hand_landmarker.task`
is missing, it is downloaded automatically from the official MediaPipe URL
(about 7.5 MB, one time only).

## 2. macOS camera permission

The first time the camera is opened, macOS shows a permission prompt:

- When running from a terminal → allow "Terminal"
  (System Settings → Privacy & Security → Camera)
- If you denied it before, enable it manually in System Settings →
  Privacy & Security → Camera, then **restart the terminal**

If there is no prompt and the camera will not open, see
[troubleshooting.md](troubleshooting.md).

## 3. Windows notes

- The firewall may prompt on first run — the Tracker only sends UDP to
  `127.0.0.1` on this machine, so allowing or denying "public networks"
  makes no difference for local use
- Camera permission: Settings → Privacy → Camera → allow desktop apps
  to access the camera

## 4. Verify the installation

```bash
# Unit tests (29 cases, pure logic, no camera needed)
.venv/bin/python -m unittest discover tests

# OSC loopback integration test (no camera needed)
.venv/bin/python tests/integration_osc_loopback.py

# Real camera + preview window
.venv/bin/python gesture-tracker/main.py
```

## 5. Load the device in Ableton Live

1. Drag `max-device/Gesture Control.amxd` onto a **MIDI track** in Live.
   ⚠️ The device depends on `gesture_mapper.js` and `gc_launcher.js` in
   the same folder — keep all three files together (do not copy the
   .amxd on its own)
2. Click the **Launch** button at the top of the device to start the
   Tracker (the Trk light turns on); or start it manually with
   `run_tracker.command` / the command line
3. The OSC / Cam / L / R indicators on the device light up and the three
   dials follow your gestures

The Launch button looks for the Tracker in this order: the project's
`.venv` virtual environment → the packaged GestureTracker under
`build/dist`. If the device is moved outside the project folder the
relative paths break; in that case start the Tracker manually (it works
exactly the same).

The device parameters (Left Open / Left Fist / Right Open / Right Fist /
Hand Distance / Left X / Left Y / Right X / Right Y) appear in Live's
automation list, can be recorded as automation, can be mapped by other
M4L devices, and are saved with the Live Set.

The Port number box on the device changes the OSC receive port
(default 9000, saved with the Set); it must match the Tracker's `--port`.

Debugging tool: `max-device/patchers/OSC Test Receiver.maxpat` is a
standalone receive test patch — open it in Max to verify the OSC chain
without Live.
