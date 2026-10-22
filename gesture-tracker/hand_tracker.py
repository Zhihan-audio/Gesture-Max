"""
hand_tracker.py — MediaPipe HandLandmarker wrapper (Tasks API)

Note: MediaPipe removed the legacy mp.solutions API after 0.10.2x; this
module uses the current official Tasks API (vision.HandLandmarker in
VIDEO mode).

Responsibilities:
  * Ensure the model file assets/hand_landmarker.task exists (auto-download when missing)
  * Take a BGR image per frame, return {'left': [(x,y)*21], 'right': [...]} (user's point of view)
  * Provide skeleton drawing (the Tasks API no longer ships drawing_utils, so it is implemented here)

Handedness note (verified on real hardware):
  main.py flips the frame horizontally first (cv2.flip(frame, 1), selfie
  mirror view). The Tasks API classifies handedness anatomically on the
  image as given — in a mirrored image the right hand looks like a left
  hand, so the returned "Left" is actually the user's right hand and the
  mapping must be inverted (the opposite of the old mp.solutions
  semantics, which assumed the input was already mirrored).
"""

import os
import sys
import time

# Official model file (release URL from the MediaPipe documentation)
MODEL_FILENAME = "hand_landmarker.task"
MODEL_URL = ("https://storage.googleapis.com/mediapipe-models/hand_landmarker/"
             "hand_landmarker/float16/1/hand_landmarker.task")
ASSETS_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "assets")

# 21-point hand skeleton topology (formerly mp.solutions.hands.HAND_CONNECTIONS)
HAND_CONNECTIONS = (
    (0, 1), (1, 2), (2, 3), (3, 4),          # thumb
    (0, 5), (5, 6), (6, 7), (7, 8),          # index finger
    (5, 9), (9, 10), (10, 11), (11, 12),     # middle finger
    (9, 13), (13, 14), (14, 15), (15, 16),   # ring finger
    (13, 17), (17, 18), (18, 19), (19, 20),  # pinky
    (0, 17),                                 # palm base
)

FINGERTIPS = (4, 8, 12, 16, 20)
SKELETON_COLOR = (157, 179, 154)  # BGR default: sage gray-green (the preview passes per-hand colors)
LANDMARK_COLOR = (106, 211, 155)


def ensure_model(model_path: str = None) -> str:
    """
    Return the model file path; download it from the official URL when
    missing (about 7.5 MB, first run only).
    Raises a RuntimeError with clear instructions if the download fails.
    """
    if model_path is None:
        model_path = os.path.join(ASSETS_DIR, MODEL_FILENAME)
        # After PyInstaller packaging, resources live in the temporary unpack dir (sys._MEIPASS)
        bundled = getattr(sys, "_MEIPASS", None)
        if bundled and not os.path.exists(model_path):
            candidate = os.path.join(bundled, "assets", MODEL_FILENAME)
            if os.path.exists(candidate):
                return candidate
    if os.path.exists(model_path) and os.path.getsize(model_path) > 1_000_000:
        return model_path

    print(f"[tracker] 模型文件缺失，正在从官方地址下载（约 7.5 MB）...\n"
          f"          {MODEL_URL}")
    os.makedirs(os.path.dirname(model_path), exist_ok=True)
    tmp_path = model_path + ".download"
    try:
        import urllib.request
        urllib.request.urlretrieve(MODEL_URL, tmp_path)
        os.replace(tmp_path, model_path)
        print(f"[tracker] 模型已保存到 {model_path}")
        return model_path
    except Exception as e:
        if os.path.exists(tmp_path):
            os.remove(tmp_path)
        raise RuntimeError(
            f"模型下载失败: {e}\n"
            f"请手动下载 {MODEL_URL}\n"
            f"并放到 {model_path}") from e


class HandTracker:
    """Thin wrapper around HandLandmarker. process() returns {'left': [...], 'right': [...]}"""

    def __init__(self, max_num_hands: int = 2,
                 min_detection_confidence: float = 0.6,
                 min_tracking_confidence: float = 0.5,
                 model_path: str = None):
        try:
            import mediapipe as mp
            from mediapipe.tasks.python import vision
            from mediapipe.tasks.python.core.base_options import BaseOptions
        except ImportError:
            print("[tracker] 错误：未安装 mediapipe。请运行 "
                  "pip install -r requirements.txt", file=sys.stderr)
            raise

        self._mp = mp
        options = vision.HandLandmarkerOptions(
            base_options=BaseOptions(model_asset_path=ensure_model(model_path)),
            running_mode=vision.RunningMode.VIDEO,
            num_hands=max_num_hands,
            min_hand_detection_confidence=min_detection_confidence,
            min_hand_presence_confidence=0.5,
            min_tracking_confidence=min_tracking_confidence,
        )
        self._landmarker = vision.HandLandmarker.create_from_options(options)
        # VIDEO mode requires strictly monotonically increasing timestamps
        self._start = time.monotonic()
        self._last_timestamp_ms = -1

    def process(self, frame_bgr):
        """
        Input: a BGR frame that has already been flipped horizontally.
        Output: {'left': 21 normalized (x, y) points or None, 'right': same}
        """
        import cv2

        hands = {"left": None, "right": None}
        try:
            rgb = cv2.cvtColor(frame_bgr, cv2.COLOR_BGR2RGB)
            mp_image = self._mp.Image(image_format=self._mp.ImageFormat.SRGB,
                                      data=rgb)
            timestamp_ms = int((time.monotonic() - self._start) * 1000)
            if timestamp_ms <= self._last_timestamp_ms:  # keep strictly increasing
                timestamp_ms = self._last_timestamp_ms + 1
            self._last_timestamp_ms = timestamp_ms
            result = self._landmarker.detect_for_video(mp_image, timestamp_ms)
        except Exception as e:
            # A single failed frame must not crash the whole program
            print(f"[tracker] MediaPipe 处理异常（跳过本帧）: {e}", file=sys.stderr)
            return hands

        if not result.hand_landmarks or not result.handedness:
            return hands

        for landmarks, handedness in zip(result.hand_landmarks, result.handedness):
            if not handedness or len(landmarks) < 21:
                continue
            label = handedness[0].category_name  # "Left" / "Right"
            points = [(lm.x, lm.y) for lm in landmarks]
            # With mirrored input the Tasks API labels are opposite to the user's
            # actual hands, so invert the mapping
            key = "right" if label == "Left" else "left"
            # If two hands land on the same side (crossed / misclassified),
            # keep the first, higher-confidence one
            if hands[key] is None:
                hands[key] = points
        return hands

    @staticmethod
    def draw_hands(frame, hands, palette=None):
        """
        Draw both hands' 21-point skeletons on the frame (for the preview).
        palette is optional: {'left': {'line': BGR, 'dot': BGR}, 'right': {...}};
        when omitted, both hands use the default colors. Fingertips
        (4/8/12/16/20) are drawn one size larger.
        """
        import cv2

        h, w = frame.shape[:2]
        for side in ("left", "right"):
            landmarks = hands.get(side)
            if landmarks is None:
                continue
            colors = (palette or {}).get(side, {})
            line_c = colors.get("line", SKELETON_COLOR)
            dot_c = colors.get("dot", LANDMARK_COLOR)
            pts = [(int(x * w), int(y * h)) for (x, y) in landmarks]
            for a, b in HAND_CONNECTIONS:
                cv2.line(frame, pts[a], pts[b], line_c, 1, cv2.LINE_AA)
            for i, p in enumerate(pts):
                cv2.circle(frame, p, 4 if i in FINGERTIPS else 2, dot_c, -1, cv2.LINE_AA)

    def close(self):
        """Release MediaPipe resources."""
        try:
            self._landmarker.close()
        except Exception:
            pass
