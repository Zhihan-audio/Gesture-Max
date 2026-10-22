"""
gesture_analysis.py — gesture geometry analysis

Input: MediaPipe's 21 hand landmarks (normalized coordinates)
Output:
  * openness       — how far the hand is open, 0.0–1.0 (continuous, combines all five fingers)
  * palm_center    — palm position (average of the wrist and the 4 MCPs)
  * palm_position  — palm x / y in the frame, 0.0–1.0 (y points up, with margin calibration)
  * hand_scale     — palm scale (used to compensate for distance from the camera)
  * hands_distance — distance between the hands, 0.0–1.0 (scale-compensated in palm-width units)

This module is pure geometry and does not depend on the MediaPipe library
itself (landmarks are passed in as an [(x, y), ...] list), which makes it
easy to unit-test.

MediaPipe hand landmark indices:
   0 WRIST        1-4  THUMB(CMC/MCP/IP/TIP)
   5-8  INDEX(MCP/PIP/DIP/TIP)   9-12 MIDDLE   13-16 RING   17-20 PINKY
"""

import math

# Landmark index constants
WRIST = 0
THUMB_TIP = 4
INDEX_MCP, INDEX_TIP = 5, 8
MIDDLE_MCP, MIDDLE_TIP = 9, 12
RING_MCP, RING_TIP = 13, 16
PINKY_MCP, PINKY_TIP = 17, 20

PALM_POINTS = (WRIST, INDEX_MCP, MIDDLE_MCP, RING_MCP, PINKY_MCP)

# Finger extension metric: tip-to-wrist distance / palm length (wrist→middle MCP).
# Below CURL_RATIO → fully curled (0); above EXTEND_RATIO → fully extended (1).
# Values come from real hand proportions: an extended fingertip sits about
# 1.7–2.1 palm lengths from the wrist, a curled one about 0.6–1.0.
# The pinky is shorter, so its thresholds are slightly lower.
FINGER_PARAMS = {
    # tip_idx: (curl_ratio, extend_ratio, weight)
    INDEX_TIP:  (1.00, 1.85, 1.0),
    MIDDLE_TIP: (1.00, 2.00, 1.0),
    RING_TIP:   (0.95, 1.90, 1.0),
    PINKY_TIP:  (0.90, 1.65, 0.8),
}
# Thumb: thumb-tip-to-pinky-MCP distance / palm width.
# When open, the thumb sits far from the pinky side (about 1.6–2.2 palm
# widths); in a fist it tucks in close (about 0.7–1.1).
THUMB_CURL_RATIO = 1.00
THUMB_EXTEND_RATIO = 1.80
THUMB_WEIGHT = 0.5


def _dist(a, b) -> float:
    """Euclidean distance between two (x, y) points."""
    return math.hypot(a[0] - b[0], a[1] - b[1])


def _safe_ratio(numerator: float, denominator: float) -> float:
    """Safe division: returns 0 when the denominator is tiny, avoiding NaN/inf."""
    if denominator < 1e-6:
        return 0.0
    return numerator / denominator


def _clamp01(x: float) -> float:
    if x != x:  # NaN
        return 0.0
    return min(max(x, 0.0), 1.0)


def palm_center(landmarks):
    """Palm center: average of the wrist and the index/middle/ring/pinky MCPs."""
    xs = sum(landmarks[i][0] for i in PALM_POINTS) / len(PALM_POINTS)
    ys = sum(landmarks[i][1] for i in PALM_POINTS) / len(PALM_POINTS)
    return (xs, ys)


def palm_position(landmarks, margin: float = 0.1):
    """
    Palm position (x, y) in the frame, each 0.0–1.0.

      x: 0 = frame left, 1 = right (the image is mirrored, matching the user's view)
      y: 0 = frame bottom, 1 = top (opposite of MediaPipe coordinates:
         raising the hand increases the value)

    margin is a border around the frame: the output reaches 0/1 once the
    palm enters the border, so the hand can hit full scale without
    touching the frame edge (where tracking tends to drop out).
    """
    cx, cy = palm_center(landmarks)
    span = max(1.0 - 2.0 * margin, 0.1)  # guard against invalid margin values
    x = _clamp01((cx - margin) / span)
    y = _clamp01((1.0 - cy - margin) / span)
    return (x, y)


def palm_width(landmarks) -> float:
    """Palm width: distance from the index MCP to the pinky MCP (pose-independent, good as a scale)."""
    return _dist(landmarks[INDEX_MCP], landmarks[PINKY_MCP])


def palm_length(landmarks) -> float:
    """Palm length: distance from the wrist to the middle MCP."""
    return _dist(landmarks[WRIST], landmarks[MIDDLE_MCP])


def hand_scale(landmarks) -> float:
    """
    Palm scale: average of palm width and palm length.
    This value changes with the user's distance from the camera, so
    normalizing by it yields gesture values that are largely independent
    of that distance.
    """
    return (palm_width(landmarks) + palm_length(landmarks)) * 0.5


def finger_extension(landmarks, tip_idx: int) -> float:
    """
    Extension of a single finger, 0.0–1.0 (index/middle/ring/pinky).
    Uses the tip→wrist distance over palm length, mapped linearly between
    the curl and extend thresholds.
    """
    curl_ratio, extend_ratio, _ = FINGER_PARAMS[tip_idx]
    ratio = _safe_ratio(_dist(landmarks[tip_idx], landmarks[WRIST]),
                        palm_length(landmarks))
    return _clamp01((ratio - curl_ratio) / (extend_ratio - curl_ratio))


def thumb_extension(landmarks) -> float:
    """Thumb extension 0.0–1.0: thumb-tip-to-pinky-MCP distance over palm width."""
    ratio = _safe_ratio(_dist(landmarks[THUMB_TIP], landmarks[PINKY_MCP]),
                        palm_width(landmarks))
    return _clamp01((ratio - THUMB_CURL_RATIO) / (THUMB_EXTEND_RATIO - THUMB_CURL_RATIO))


def openness(landmarks) -> float:
    """
    How far the hand is open, 0.0–1.0 (continuous).

    Combines the (weighted) extension of the four fingers plus the thumb
    (at lower weight). 0.0 = closed fist, 1.0 = all five fingers fully
    spread, with continuous values in between.
    """
    if not landmarks or len(landmarks) < 21:
        return 0.0
    total = 0.0
    weight_sum = 0.0
    for tip_idx, (_, _, weight) in FINGER_PARAMS.items():
        total += finger_extension(landmarks, tip_idx) * weight
        weight_sum += weight
    total += thumb_extension(landmarks) * THUMB_WEIGHT
    weight_sum += THUMB_WEIGHT
    return _clamp01(total / weight_sum)


def hands_distance_raw(left_landmarks, right_landmarks) -> float:
    """
    Raw palm-to-palm distance, in multiples of the average palm scale.

    Dividing by the mean hand_scale of both hands compensates for scale:
    when the user steps back, the palms shrink and the pixel distance
    shrinks with them, so the ratio stays roughly constant — which makes
    the result much less sensitive to moving toward or away from the camera.
    """
    lc = palm_center(left_landmarks)
    rc = palm_center(right_landmarks)
    scale = (hand_scale(left_landmarks) + hand_scale(right_landmarks)) * 0.5
    return _safe_ratio(_dist(lc, rc), scale)


def hands_distance_normalized(left_landmarks, right_landmarks,
                              near: float = 1.2, far: float = 7.0) -> float:
    """
    Distance between the hands, 0.0–1.0.

    near / far are calibration parameters (in multiples of the average palm scale):
      raw <= near → 0.0 (hands together)
      raw >= far  → 1.0 (hands spread as wide as possible)
    The result is clamped to [0, 1].
    """
    far = max(far, near + 0.1)  # guard against invalid calibration values
    raw = hands_distance_raw(left_landmarks, right_landmarks)
    return _clamp01((raw - near) / (far - near))
