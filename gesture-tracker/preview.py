"""
preview.py — Preview Window (standalone preview)

Shows in an OpenCV window:
  * the camera image (mirrored)
  * the 21-point hand skeletons
  * left/right hand labels, palm x/y and openness
  * the hand-distance connecting line and its value
  * two rows of bars at the bottom: palm x·y (top row), openness and hand distance (bottom row)
  * FPS and the OSC target port

The window is drawn by the Python process and uses none of Ableton Live's
or Max's resources. Press q or ESC to quit the program.
"""

import sys

import cv2
import numpy as np

# ---- Botanica palette (BGR): a nighttime greenhouse — moss base, young-leaf and
# fern greens for the two hands, petal pink for alerts, pollen yellow for the distance line ----
COLOR_LEFT = (106, 211, 155)     # left hand: young-leaf green #9BD36A
COLOR_RIGHT = (154, 179, 94)     # right hand: fern green #5EB39A
COLOR_FIST = (176, 155, 229)     # fist alert: petal pink #E59BB0
COLOR_DISTANCE = (106, 207, 240) # distance line: pollen yellow #F0CF6A
COLOR_TEXT = (223, 238, 243)     # ivory #F3EEDF
COLOR_DIM = (157, 179, 154)      # sage gray-green #9AB39D
COLOR_BAR_BG = (34, 42, 43)      # soil black #2B2A22
GRADE_TINT = (30, 51, 38)        # moss tint washed over the whole frame #26331E
GRADE_TINT_MIX = 0.22            # moss tint proportion
VIGNETTE_EDGE = 0.55             # corner brightness (1 = no darkening)
# Skeleton: lines one shade darker than each hand's color; fingertips enlarged like leaf buds
SKELETON_PALETTE = {
    "left":  {"line": (70, 150, 105), "dot": COLOR_LEFT},
    "right": {"line": (105, 125, 62), "dot": COLOR_RIGHT},
}

WINDOW_NAME = "Gesture Tracker Preview"


def _activate_macos_gui():
    """
    macOS: promote this process to a regular foreground application.

    Without this, the system treats a bare script process as a background
    agent and the traffic-light buttons in the OpenCV window's corner are
    all grayed out and unclickable. Requires pyobjc (already in
    requirements). Degrades silently on failure — the window can still be
    closed with q/ESC.
    """
    if sys.platform != "darwin":
        return
    try:
        from AppKit import NSApplication, NSApplicationActivationPolicyRegular
        app = NSApplication.sharedApplication()
        app.setActivationPolicy_(NSApplicationActivationPolicyRegular)
        app.activateIgnoringOtherApps_(True)
    except Exception as e:
        print(f"[preview] 无法激活前台应用状态（关闭按钮可能不可用，"
              f"请用 q/ESC 退出）: {e}", file=sys.stderr)


class PreviewWindow:
    """Camera image + gesture data overlay."""

    def __init__(self, tracker=None):
        self._tracker = tracker  # used for skeleton drawing (may be None; test mode has no skeleton)
        self._window_created = False
        self._last_hands = None
        self._close_enabled = False
        self._grade_size = None  # grading layers are cached per frame size
        self._tint = None
        self._vignette = None
        _activate_macos_gui()

    def _grade(self, frame):
        """Full-frame color grade: a moss tint plus a corner vignette (both cached whole-image ops, ~1–2 ms per frame)."""
        h, w = frame.shape[:2]
        if self._grade_size != (w, h):
            self._tint = np.full((h, w, 3), GRADE_TINT, dtype=np.uint8)
            ys, xs = np.mgrid[0:h, 0:w].astype(np.float32)
            r = np.hypot((xs - w / 2) / (w / 2), (ys - h / 2) / (h / 2)) / 1.42
            v = 1.0 - (1.0 - VIGNETTE_EDGE) * np.clip(r, 0.0, 1.0) ** 2
            self._vignette = cv2.merge([(v * 255).astype(np.uint8)] * 3)
            self._grade_size = (w, h)
        frame = cv2.addWeighted(frame, 1.0 - GRADE_TINT_MIX, self._tint, GRADE_TINT_MIX, 0)
        return cv2.multiply(frame, self._vignette, scale=1.0 / 255.0)

    def _enable_close_button(self):
        """
        OpenCV's Cocoa window is created without the Closable bit in its
        style mask, so the red close button is always grayed out. After
        the window exists, find the matching NSWindow and add Closable
        back into its styleMask. Degrades silently on failure (q/ESC
        still quits).
        """
        if sys.platform != "darwin" or self._close_enabled:
            return
        try:
            from AppKit import NSApplication, NSWindowStyleMaskClosable
            for win in NSApplication.sharedApplication().windows():
                if str(win.title()) == WINDOW_NAME:
                    win.setStyleMask_(win.styleMask()
                                      | NSWindowStyleMaskClosable)
                    self._close_enabled = True
                    break
        except Exception as e:
            print(f"[preview] 无法启用关闭按钮（请用 q/ESC 退出）: {e}",
                  file=sys.stderr)
            self._close_enabled = True  # try only once; don't retry and spam every frame

    def _draw_bar(self, frame, x, y, w, h, value, color, label):
        """Draw one horizontal bar + label text: soil-colored base, hand-colored fill, small ivory text."""
        cv2.rectangle(frame, (x, y), (x + w, y + h), COLOR_BAR_BG, -1)
        fill = int(w * min(max(value, 0.0), 1.0))
        if fill > 0:
            cv2.rectangle(frame, (x, y), (x + fill, y + h), color, -1)
        cv2.rectangle(frame, (x, y), (x + w, y + h), COLOR_DIM, 1)
        cv2.putText(frame, f"{label} {value:.2f}", (x, y - 6),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.45, COLOR_TEXT, 1, cv2.LINE_AA)

    def compose(self, frame, state, hands=None):
        """
        Fully draw one frame (grading + skeletons + annotations) and
        return the new image without displaying it. state is the
        TrackerState from main.py, hands is the
        {'left': [...], 'right': [...]} landmark dict (may be None).
        """
        h, w = frame.shape[:2]
        frame = self._grade(frame)

        # ---- Hand skeletons ----
        if self._tracker is not None and hands is not None:
            self._tracker.draw_hands(frame, hands, SKELETON_PALETTE)

        # ---- Hand-distance connecting line ----
        if state.left_palm_px and state.right_palm_px:
            cv2.line(frame, state.left_palm_px, state.right_palm_px,
                     COLOR_DISTANCE, 1, cv2.LINE_AA)
            for p in (state.left_palm_px, state.right_palm_px):
                cv2.circle(frame, p, 4, COLOR_DISTANCE, 1, cv2.LINE_AA)
            mid = ((state.left_palm_px[0] + state.right_palm_px[0]) // 2,
                   (state.left_palm_px[1] + state.right_palm_px[1]) // 2)
            cv2.putText(frame, f"dist {state.distance:.2f}", (mid[0] + 8, mid[1] - 8),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.55, COLOR_DISTANCE, 1, cv2.LINE_AA)

        # ---- Hand labels + palm x/y ----
        for tag, palm, fist, x, y, color in (
                ("L", state.left_palm_px, state.left_fist,
                 state.left_x, state.left_y, COLOR_LEFT),
                ("R", state.right_palm_px, state.right_fist,
                 state.right_x, state.right_y, COLOR_RIGHT)):
            if not palm:
                continue
            cv2.putText(frame, tag, (palm[0] - 20, palm[1] + 40),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, color, 2, cv2.LINE_AA)
            if fist:
                cv2.putText(frame, "FIST", (palm[0] + 4, palm[1] + 40),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.6, COLOR_FIST, 2, cv2.LINE_AA)
            cv2.putText(frame, f"x {x:.2f}  y {y:.2f}", (palm[0] - 20, palm[1] + 62),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.45, COLOR_DIM, 1, cv2.LINE_AA)

        # ---- Bottom bars: openness/distance/openness (lower row), palm x·y (upper row) ----
        bar_w = (w - 80) // 3
        base_y = h - 26
        self._draw_bar(frame, 20, base_y, bar_w, 10,
                       state.left_open, COLOR_LEFT, "L Open")
        self._draw_bar(frame, 40 + bar_w, base_y, bar_w, 10,
                       state.distance, COLOR_DISTANCE, "Distance")
        self._draw_bar(frame, 60 + bar_w * 2, base_y, bar_w, 10,
                       state.right_open, COLOR_RIGHT, "R Open")
        bar_w4 = (w - 100) // 4
        row_y = base_y - 32
        for k, (label, value, color) in enumerate((
                ("L X", state.left_x, COLOR_LEFT), ("L Y", state.left_y, COLOR_LEFT),
                ("R X", state.right_x, COLOR_RIGHT), ("R Y", state.right_y, COLOR_RIGHT))):
            self._draw_bar(frame, 20 + k * (bar_w4 + 20), row_y, bar_w4, 10,
                           value, color, label)

        # ---- Top status line ----
        det = []
        det.append("L:on" if state.left_detected else "L:--")
        det.append("R:on" if state.right_detected else "R:--")
        cv2.putText(frame, f"{state.fps:.0f} FPS  {' '.join(det)}  "
                    f"OSC {state.osc_target}", (20, 30),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.55, COLOR_TEXT, 1, cv2.LINE_AA)
        cv2.putText(frame, "q / ESC : quit", (20, 52),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.45, COLOR_DIM, 1, cv2.LINE_AA)
        return frame

    def render(self, frame, state, hands=None) -> bool:
        """
        Draw and display one frame. Returns False when the user requested
        to quit (pressed q / ESC).
        """
        frame = self.compose(frame, state, hands)

        # ---- Display ----
        try:
            cv2.imshow(WINDOW_NAME, frame)
            self._window_created = True
            self._enable_close_button()
        except cv2.error as e:
            # No display environment (e.g. SSH): degrade gracefully to headless
            print(f"[preview] 无法创建窗口，转为无预览模式: {e}")
            return True

        key = cv2.waitKey(1) & 0xFF
        if key in (ord("q"), 27):  # q or ESC
            return False

        # The user clicked the window's close button → window no longer visible → treat as quit
        try:
            if cv2.getWindowProperty(WINDOW_NAME, cv2.WND_PROP_VISIBLE) < 1:
                return False
        except cv2.error:
            return False
        return True

    def close(self):
        if self._window_created:
            try:
                cv2.destroyWindow(WINDOW_NAME)
            except cv2.error:
                pass
