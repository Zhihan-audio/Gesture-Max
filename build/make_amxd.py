"""
make_amxd.py — package a .maxpat into an Ableton-loadable .amxd

.amxd container format (reverse-engineered from Live's official templates
and devices saved by Max):

  offset  content
  0       "ampf"                     magic number
  4       uint32 LE = 4              length of the next field
  8       4-byte device type:  "mmmm"=MIDI effect  "aaaa"=audio effect  "iiii"=instrument
  12      "meta"
  16      uint32 LE = 4              meta payload length
  20      4 bytes of 0x00            (unfrozen device)
  24      "ptch"
  28      uint32 LE                  JSON payload length (including trailing NUL)
  32      maxpat JSON text + b"\\x00"

Usage:
  python build/make_amxd.py                        # package the main device by default
  python build/make_amxd.py in.maxpat out.amxd midi
"""

import json
import os
import struct
import sys

TYPE_CODES = {"midi": b"mmmm", "audio": b"aaaa", "instrument": b"iiii"}

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEFAULT_IN = os.path.join(ROOT, "max-device", "Gesture Control.maxpat")
DEFAULT_OUT = os.path.join(ROOT, "max-device", "Gesture Control.amxd")


def make_amxd(maxpat_path: str, amxd_path: str, device_type: str = "midi"):
    with open(maxpat_path, "r", encoding="utf-8") as f:
        text = f.read()
    json.loads(text)  # validate the JSON first so we never package a broken device

    payload = text.encode("utf-8") + b"\x00"
    header = (b"ampf" + struct.pack("<I", 4) + TYPE_CODES[device_type]
              + b"meta" + struct.pack("<I", 4) + b"\x00\x00\x00\x00"
              + b"ptch" + struct.pack("<I", len(payload)))
    with open(amxd_path, "wb") as f:
        f.write(header + payload)
    print(f"OK: {amxd_path} ({len(header) + len(payload)} bytes, "
          f"type={device_type})")


if __name__ == "__main__":
    src = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_IN
    dst = sys.argv[2] if len(sys.argv) > 2 else DEFAULT_OUT
    dtype = sys.argv[3] if len(sys.argv) > 3 else "midi"
    if dtype not in TYPE_CODES:
        sys.exit(f"设备类型必须是 {list(TYPE_CODES)} 之一")
    make_amxd(src, dst, dtype)
