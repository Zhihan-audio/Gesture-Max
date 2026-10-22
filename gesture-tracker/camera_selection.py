"""
camera_selection.py — camera enumeration and smart selection (macOS)

Background: macOS Continuity Camera registers a nearby iPhone as a
camera, and it often takes OpenCV index 0, so the program would connect
to the phone's camera the moment it starts.

The OpenCV AVFoundation backend (cap_avfoundation_mac.mm) builds its
indices like this:
    [AVCaptureDevice devicesWithMediaType:Video]
      + [AVCaptureDevice devicesWithMediaType:Muxed]
    sorted by the uniqueID string → the sorted position is the VideoCapture index

This module replicates the same enumeration and sort via pyobjc, so
device names/types map exactly onto OpenCV indices, enabling:
  * Skip iPhones (Continuity / Desk View) and virtual cameras by default; prefer the built-in camera
  * --camera-name selection by name substring
  * --list-cameras listing of every device and its OpenCV index

On non-macOS systems, without pyobjc, or when enumeration fails, every
function degrades safely (returns None and the caller falls back to the
old try-each-index behavior).
"""

import sys

# Device category → selection priority (lower = preferred)
KIND_SCORE = {"builtin": 0, "external": 1, "virtual": 2, "continuity": 3}
KIND_LABEL = {"builtin": "内建", "external": "外接", "virtual": "虚拟",
              "continuity": "iPhone连续互通"}


def _classify(device) -> str:
    """Classify an AVCaptureDevice as builtin / external / virtual / continuity."""
    name = str(device.localizedName())
    dtype = str(device.deviceType())

    try:
        if device.isContinuityCamera():
            return "continuity"
    except Exception:
        pass
    if "DeskView" in dtype or "Desk View" in name:
        return "continuity"
    if "iPhone" in name or "iPad" in name:
        return "continuity"
    if "BuiltIn" in dtype:
        return "builtin"
    if "virtual" in name.lower():
        return "virtual"
    return "external"


def list_cameras():
    """
    Return the camera list in OpenCV AVFoundation index order:
      [{"index", "name", "kind", "unique_id"}, ...]
    Returns None on failure (non-macOS / no pyobjc).
    """
    if sys.platform != "darwin":
        return None
    try:
        import AVFoundation as AVF
    except ImportError:
        return None

    try:
        devices = list(AVF.AVCaptureDevice.devicesWithMediaType_(
            AVF.AVMediaTypeVideo))
        devices += list(AVF.AVCaptureDevice.devicesWithMediaType_(
            AVF.AVMediaTypeMuxed))
        # Exactly like OpenCV: sort by the uniqueID string
        devices.sort(key=lambda d: str(d.uniqueID()))
    except Exception as e:
        print(f"[camera] 设备枚举失败（退回索引模式）: {e}", file=sys.stderr)
        return None

    return [{"index": i,
             "name": str(d.localizedName()),
             "kind": _classify(d),
             "unique_id": str(d.uniqueID())}
            for i, d in enumerate(devices)]


def format_camera_table(cams, chosen_index=None) -> str:
    """Build the device list text (shared by --list-cameras and the startup log)."""
    lines = []
    for c in cams:
        mark = "  ← 使用" if c["index"] == chosen_index else ""
        lines.append(f"    {c['index']}: {c['name']} "
                     f"[{KIND_LABEL[c['kind']]}]{mark}")
    return "\n".join(lines)


def resolve_camera_order(cfg):
    """
    Decide the camera trial order. Returns (indices, cams):
      indices — list of OpenCV indices to try in order
      cams    — enumeration result (None when enumeration is unavailable)

    Priority:
      1. camera_name non-empty → name substring match (case-insensitive)
      2. explicit --camera N on the command line → respect the user's choice
      3. avoid_continuity_camera (default on) → built-in > external > virtual > iPhone
      4. none of the above apply → camera_index from the config
    If a device fails to open, fall back in the same priority order;
    iPhones always come last.
    """
    cams = list_cameras()
    if not cams:
        # Cannot enumerate: old behavior — try the configured index first, then 0..2
        first = cfg.camera_index
        return [first] + [i for i in range(3) if i != first], None

    def fallback_order(exclude):
        rest = [c for c in cams if c["index"] != exclude]
        rest.sort(key=lambda c: (KIND_SCORE[c["kind"]], c["index"]))
        return [c["index"] for c in rest]

    chosen = None

    # 1. Match by name
    if getattr(cfg, "camera_name", ""):
        wanted = cfg.camera_name.lower()
        for c in cams:
            if wanted in c["name"].lower():
                chosen = c["index"]
                break
        if chosen is None:
            print(f"[camera] 未找到名称含 \"{cfg.camera_name}\" 的摄像头，"
                  "改用自动选择", file=sys.stderr)

    # 2. Explicit index from the command line
    if chosen is None and getattr(cfg, "camera_index_explicit", False):
        chosen = cfg.camera_index

    # 3. Auto-select: skip Continuity / virtual cameras
    if chosen is None:
        if cfg.avoid_continuity_camera:
            best = min(cams, key=lambda c: (KIND_SCORE[c["kind"]], c["index"]))
            chosen = best["index"]
        else:
            chosen = cfg.camera_index

    return [chosen] + fallback_order(chosen), cams
