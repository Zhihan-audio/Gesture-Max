# Usage (Tracker)

## Launching from the device (recommended)

The status bar at the top of the device:

- **Launch** — start the Tracker (uses the current Port and Prev settings)
- **Stop** — graceful stop (releases the camera, sends status=0)
- **Prev** toggle — whether to show the preview window on launch (saved with the Set)
- **Trk** light — Tracker process state

The Tracker's log output is forwarded to the Max Console (device wrench
icon → Console). When the device is deleted or Live quits, the Tracker
child process is cleaned up automatically — it never lingers and holds
the camera.

## Launching from the command line

```bash
.venv/bin/python gesture-tracker/main.py              # default: camera + preview
.venv/bin/python gesture-tracker/main.py --no-preview # no preview (best performance)
.venv/bin/python gesture-tracker/main.py --debug      # print a status summary every second
.venv/bin/python gesture-tracker/main.py --test-signal # synthetic signal (no camera)
```

On macOS you can also double-click `gesture-tracker/run_tracker.command`;
on Windows, double-click `gesture-tracker\run_tracker.bat`.

To quit: press `q` or `ESC` in the preview window, or `Ctrl+C` in the
terminal. On exit the camera is released and
`/gesture/camera/status 0` is sent automatically.

## Command-line options

| Option | Default | Description |
|---|---|---|
| `--port N` | 9000 | OSC send port (use 9001/9002… for multiple instances) |
| `--ip ADDR` | 127.0.0.1 | OSC target address |
| `--camera N` | auto | camera index (auto-selected by default, see below) |
| `--camera-name S` | — | select a camera by name (substring match, e.g. `--camera-name FaceTime`) |
| `--list-cameras` | — | list all cameras and their indices, then exit |
| `--width / --height` | 640×480 | capture resolution |
| `--fps N` | 30 | target frame rate (5–120) |
| `--smoothing MS` | 100 | smoothing time constant, 0–1000 ms |
| `--deadzone X` | 0.01 | dead zone (ignore changes smaller than this) |
| `--lost-mode M` | hold | hand-lost mode: hold / zero / center |
| `--no-preview` / `--preview` | on | preview window on/off |
| `--debug` | off | debug mode |
| `--test-signal` | off | no camera; send a synthetic sine-wave signal |
| `--save-config` | — | write the current configuration to config.json |

## config.json

Running with `--save-config` creates `config.json` under
`gesture-tracker/`, which you can edit directly. Besides the
command-line options it also contains:

| Key | Default | Description |
|---|---|---|
| `min_detection_confidence` | 0.6 | minimum detection confidence |
| `min_tracking_confidence` | 0.5 | minimum tracking confidence |
| `max_num_hands` | 2 | maximum number of hands (1–2) |
| `fist_enter_threshold` | 0.25 | openness below this value enters the fist state |
| `fist_exit_threshold` | 0.40 | openness above this value exits the fist state (hysteresis) |
| `distance_near` | 1.2 | distance calibration: at or below this → 0.0 (unit = multiples of palm width) |
| `distance_far` | 7.0 | distance calibration: at or beyond this → 1.0 |
| `position_margin` | 0.1 | frame margin for palm x/y (0–0.4): once the palm enters this border strip the output reaches 0/1 |
| `lost_timeout_ms` | 1000 | how long after a hand is lost before the lost mode kicks in |
| `lost_glide_ms` | 800 | glide time for the zero/center modes |
| `flip_horizontal` | true | mirror the image (keeps left/right-hand labels correct — do not disable) |
| `status_interval_ms` | 500 | status heartbeat interval |

Command-line options take precedence over config.json.

## Camera selection (macOS)

macOS Continuity Camera registers a nearby iPhone as a camera, and it
often takes OpenCV index 0 — left unhandled, the program would connect
to your phone the moment it starts.

This program defaults to `avoid_continuity_camera: true`: on startup it
enumerates all devices (in OpenCV's actual index order), automatically
picks in the priority order **built-in > external > virtual > iPhone**,
and prints the device table to the terminal.

- To see the device list: `--list-cameras`
- To force a specific camera: `--camera-name "FaceTime"` or `--camera N`
 (an explicit `--camera` overrides auto-selection)
- To use the iPhone as the camera on purpose: `--camera-name iPhone`
  (or your phone's name), or set `avoid_continuity_camera` to `false`
  in config.json

## How the gestures work

- **Openness**: combines the extension of the index/middle/ring/pinky
  fingers (scaled by the wrist–middle-MCP distance) plus the
  thumb-to-pinky-side distance (lower weight); continuous 0–1 output,
  independent of how far you are from the camera.
- **Fist**: hysteresis decision on the smoothed openness (default:
  enter below 0.25, exit above 0.40), so it never flickers near the
  threshold.
- **Hand distance**: distance between the two palm centers (average of
  the wrist point and the 4 finger bases), divided by the average palm
  scale of both hands for distance compensation, then mapped to 0–1 with
  the near/far calibration. Hands together ≈ 0, arms spread wide ≈ 1.
- **Palm position x/y**: each palm's position in the frame, 0–1 on each
  axis. x runs from frame left to right (the image is mirrored, matching
  what you see), y runs from frame bottom to top (raising your hand
  increases the value). A `position_margin` border (default 10%) is left
  around the frame, so your hand reaches 0 or 1 without touching the
  frame edge (where tracking tends to drop out). Like openness, the
  values are smoothed and dead-zoned, and handled by `--lost-mode` when
  the hand is lost (`center` glides x/y back to 0.5).

## Hand-lost behavior

After a hand leaves the frame:

1. For the first second (`lost_timeout_ms`): every mode holds the last
   valid value
2. After the timeout: `hold` keeps holding; `zero` glides to 0.0 over
   0.8 s; `center` glides to 0.5
3. When the hand reappears: live data resumes immediately

Meanwhile `/gesture/left|right/detected` drops to 0 right away, which
the Max device can use to show detection state.

## Multiple instances

Each device instance in Ableton pairs with one Tracker instance on its
own port:

```bash
.venv/bin/python gesture-tracker/main.py --port 9001
```

Set the receive port on the Max device to the same value (the Stage 3
device UI provides this setting). Note: a camera can only be held by one
Tracker at a time; multi-instance setups are usually "one Tracker + several
Max devices listening on the same port" or "multiple cameras on multiple
ports".
