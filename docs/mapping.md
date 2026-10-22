# Parameter Mapping

> Current status: both approach A (Stage 3) and approach B (Stage 4) are implemented.

## Quick start (approach B: 8 general-purpose mapping slots)

The device provides **8 independent mapping slots** (two columns of 4).
Each slot picks its gesture source with the **Src menu** (L Open /
L Fist / R Open / R Fist / H Dist / L X / L Y / R X / R Y),
so **one gesture can drive several Live parameters at once** — for
example, three slots can all use L Open, pointed at filter frequency,
reverb amount and volume, each with its own Min/Max/Inv/Time/On.

1. Start the Tracker and load the Gesture Control device
2. Pick a gesture source with `Src` on a slot (the first 5 slots default
   to the 5 gestures in order)
3. Click that slot's **Map** (the target field shows `>> click a param...`)
4. In Live, **click or move any parameter** (a knob on another device,
   a Mixer volume, etc.)
5. The target field shows `device name | parameter name`, the target
   grays out, and the gesture takes control
6. `Min` / `Max` bound the output range, `Inv` inverts, `Time` sets the
   smoothing in milliseconds, turning `On` off pauses control (the
   target returns to manual use), `x` unmaps

`Min` / `Max` are **fractions of the target parameter's range** (0 … 1),
independent of the target's actual units: when you map a target, the
device reads that parameter's min/max and converts the fraction linearly
to raw values. So for LFO Depth (0–100%), pan (L50–R50, i.e. -1 … 1) or
filter frequency, the default 0 / 1 means full range; to sweep pan only
from center to right, set `Min` to 0.5.

Note: while Map is listening, the device ignores its own parameters;
click Map again to cancel listening. A bound target parameter grays out
in Live (it is remote-controlled by live.remote~) — this is standard
Live behavior, and it returns to normal after unbinding (`x` or turning
On off).

## Approach A: native Ableton parameters (Stage 3)

The device exposes 9 standard Live parameters (`live.dial` /
`live.toggle` with Parameter Mode enabled — regular parameters, separate
from `live.remote~`):

| Long Name | Short Name | Type | Range |
|---|---|---|---|
| Left Open | L Open | float | 0.0–1.0 |
| Left Fist | L Fist | enum (Off/On) | 0/1 |
| Right Open | R Open | float | 0.0–1.0 |
| Right Fist | R Fist | enum (Off/On) | 0/1 |
| Hand Distance | H Dist | float | 0.0–1.0 |
| Left X | L X | float | 0.0–1.0 |
| Left Y | L Y | float | 0.0–1.0 |
| Right X | R X | float | 0.0–1.0 |
| Right Y | R Y | float | 0.0–1.0 |

X/Y are the palm position in the frame: X runs 0→1 from frame left to
right, Y runs 0→1 from frame bottom to top (raising your hand increases
the value). The four dials live in their own panel on the far right of
the device.

Features:

- Shown in Live's automation list; automation can be recorded
- Can be targeted by other M4L devices (the Map feature of LFO,
  Envelope Follower, etc.)
- Saved and restored with the Live Set (`parameter_enable` + Initial Value)
- Short Names appear on Push in the order above

Note: these parameters are driven by the OSC data. When you record
automation, Live records the gesture data stream itself.

## Approach B: in-device direct mapping (implementation details)

One mapping slot per gesture parameter, 5 in total, fully independent:

```
[name] [live value] [Map] [x] [target name] [Min] [Max] [Inv] [Time] [On]
```

Key implementation points:

- Target capture: `js gesture_mapper.js` observes the Live API's
  `live_set view selected_parameter`; only one slot may listen at a
  time, and the device's own parameters are ignored — slots never
  overwrite each other
- Each slot holds its own `live.remote~` (float-precision direct
  control, no 128-step quantization)
- Smoothing: gesture value → `line~` ramps the signal over Time(ms) →
  `live.remote~`
- Scaling formula: `norm = Min + (x + Inv*(1-2x)) * (Max-Min)`, then
  converted to the target parameter's range:
  `out = pmin + norm * (pmax - pmin)` (the js reads the target's
  min/max on Map / restore and sends it back to the patch as a `range`
  message)
- The target is persisted as a **canonical path** via `pattr`, saved
  with the Live Set; reopening the project re-resolves and restores it;
  a dead path shows `Missing Target` and unbinds automatically — no
  errors, no dialogs
- Unmap / disabling Enable releases the binding immediately and the
  target parameter returns to manual control
- Min/Max/Inv/Time/On are all "Stored Only" parameters: saved with the
  Set but hidden from the automation list (avoids polluting the
  automation menu with 5×5=25 entries)

## OSC → parameter signal chain

```
udpreceive → route(address) → clip
  → [approach A] live.dial / live.toggle (automation / save / Push)
  → [approach B] expr(Min,Max,Invert) → line(Smooth) → expr(target min/max scaling)
            → live.remote~ → target parameter
```

## Known limitations

- If the parameter you want to map is **already the selected parameter
  in Live**, click another parameter first and then click it
  (capture does not trigger unless selected_parameter changes)
- Deleting the target device while running: the gesture stops having an
  effect but the target name stays; after reopening the project it shows
  Missing Target. Just Map again
- Two slots can map to the same target, but they will fight each
  other — avoid this
