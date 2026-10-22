"""
osc_sender.py — OSC output

Sends gesture data to Max for Live on a fixed address table:

  /gesture/left/openness    float 0.0–1.0
  /gesture/left/fist        int   0/1
  /gesture/left/detected    int   0/1
  /gesture/right/openness   float 0.0–1.0
  /gesture/right/fist       int   0/1
  /gesture/right/detected   int   0/1
  /gesture/hands/distance   float 0.0–1.0
  /gesture/left/x           float 0.0–1.0 (0 = frame left, 1 = right)
  /gesture/left/y           float 0.0–1.0 (0 = frame bottom, 1 = top)
  /gesture/right/x          float 0.0–1.0
  /gesture/right/y          float 0.0–1.0
  /gesture/camera/status    int   0 = stopped, 1 = running, 2 = error

UDP is connectionless: send never fails or blocks even when nothing is
listening on the Max side, so the Tracker can start before Ableton —
startup order does not matter.
"""

import sys

from pythonosc.udp_client import SimpleUDPClient

# OSC address table (the route object on the Max side must match)
ADDR_LEFT_OPEN = "/gesture/left/openness"
ADDR_LEFT_FIST = "/gesture/left/fist"
ADDR_LEFT_DETECTED = "/gesture/left/detected"
ADDR_RIGHT_OPEN = "/gesture/right/openness"
ADDR_RIGHT_FIST = "/gesture/right/fist"
ADDR_RIGHT_DETECTED = "/gesture/right/detected"
ADDR_DISTANCE = "/gesture/hands/distance"
ADDR_LEFT_X = "/gesture/left/x"
ADDR_LEFT_Y = "/gesture/left/y"
ADDR_RIGHT_X = "/gesture/right/x"
ADDR_RIGHT_Y = "/gesture/right/y"
ADDR_STATUS = "/gesture/camera/status"

STATUS_STOPPED = 0
STATUS_RUNNING = 1
STATUS_ERROR = 2


class OSCSender:
    """UDP OSC client that sends gesture data to Max for Live."""

    def __init__(self, ip: str = "127.0.0.1", port: int = 9000):
        self.ip = ip
        self.port = port
        try:
            self._client = SimpleUDPClient(ip, port)
        except OSError as e:
            print(f"[osc] 无法创建 OSC 客户端 {ip}:{port} — {e}", file=sys.stderr)
            raise
        self._error_logged = False

    def _send(self, address: str, value):
        """Send one message; network errors are logged once — no spam, no breaking the main loop."""
        try:
            self._client.send_message(address, value)
            self._error_logged = False
        except OSError as e:
            if not self._error_logged:
                print(f"[osc] 发送失败（将继续重试，不再重复提示）: {e}",
                      file=sys.stderr)
                self._error_logged = True

    def send_gestures(self, left_open: float, left_fist: int, left_detected: int,
                      right_open: float, right_fist: int, right_detected: int,
                      distance: float, left_x: float, left_y: float,
                      right_x: float, right_y: float):
        """Called once per frame; sends all 11 gesture channels."""
        self._send(ADDR_LEFT_OPEN, float(left_open))
        self._send(ADDR_LEFT_FIST, int(left_fist))
        self._send(ADDR_LEFT_DETECTED, int(left_detected))
        self._send(ADDR_RIGHT_OPEN, float(right_open))
        self._send(ADDR_RIGHT_FIST, int(right_fist))
        self._send(ADDR_RIGHT_DETECTED, int(right_detected))
        self._send(ADDR_DISTANCE, float(distance))
        self._send(ADDR_LEFT_X, float(left_x))
        self._send(ADDR_LEFT_Y, float(left_y))
        self._send(ADDR_RIGHT_X, float(right_x))
        self._send(ADDR_RIGHT_Y, float(right_y))

    def send_status(self, status: int):
        """Send the camera/program status heartbeat."""
        self._send(ADDR_STATUS, int(status))

    def close(self):
        """Send the stopped status and close the underlying socket."""
        self.send_status(STATUS_STOPPED)
        try:
            self._client._sock.close()
        except (AttributeError, OSError):
            pass
