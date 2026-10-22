"""
test_gesture_analysis.py — unit tests for gesture geometry analysis

Uses synthetic 21-point landmark data to verify:
  * open hand → openness close to 1
  * fist → openness close to 0
  * scale compensation of the hand distance (user's distance from the camera has no effect)
  * distance normalization and near/far calibration
  * palm x/y direction (y points up) and margin calibration
  * degenerate input never produces NaN or out-of-range values

Run: python -m unittest discover tests
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))), "gesture-tracker"))

import gesture_analysis as ga


def make_hand(wrist, index_mcp, middle_mcp, ring_mcp, pinky_mcp,
              thumb_tip, index_tip, middle_tip, ring_tip, pinky_tip):
    """Build a 21-point list, filling only the landmarks the analysis uses; the rest sit near the palm center."""
    lm = [(0.5, 0.5)] * 21
    lm[ga.WRIST] = wrist
    lm[ga.INDEX_MCP] = index_mcp
    lm[ga.MIDDLE_MCP] = middle_mcp
    lm[ga.RING_MCP] = ring_mcp
    lm[ga.PINKY_MCP] = pinky_mcp
    lm[ga.THUMB_TIP] = thumb_tip
    lm[ga.INDEX_TIP] = index_tip
    lm[ga.MIDDLE_TIP] = middle_tip
    lm[ga.RING_TIP] = ring_tip
    lm[ga.PINKY_TIP] = pinky_tip
    return lm


def open_hand():
    """An open hand: fingertips about 2 palm lengths from the wrist, thumb far from the pinky side."""
    return make_hand(
        wrist=(0.5, 0.8),
        index_mcp=(0.42, 0.62), middle_mcp=(0.5, 0.6),
        ring_mcp=(0.56, 0.61), pinky_mcp=(0.62, 0.63),
        thumb_tip=(0.26, 0.54),
        index_tip=(0.40, 0.40), middle_tip=(0.50, 0.37),
        ring_tip=(0.58, 0.40), pinky_tip=(0.65, 0.46),
    )


def fist_hand():
    """A fist: fingertips pulled back near the palm, thumb tucked in by the pinky side."""
    return make_hand(
        wrist=(0.5, 0.8),
        index_mcp=(0.42, 0.62), middle_mcp=(0.5, 0.6),
        ring_mcp=(0.56, 0.61), pinky_mcp=(0.62, 0.63),
        thumb_tip=(0.54, 0.66),
        index_tip=(0.45, 0.68), middle_tip=(0.50, 0.67),
        ring_tip=(0.55, 0.68), pinky_tip=(0.59, 0.70),
    )


def scale_hand(lm, factor, origin=(0.5, 0.5)):
    """Scale the whole hand around origin (simulates the user moving toward/away from the camera)."""
    return [(origin[0] + (x - origin[0]) * factor,
             origin[1] + (y - origin[1]) * factor) for (x, y) in lm]


def translate_hand(lm, dx, dy):
    return [(x + dx, y + dy) for (x, y) in lm]


class TestOpenness(unittest.TestCase):
    def test_open_hand_high(self):
        self.assertGreater(ga.openness(open_hand()), 0.8)

    def test_fist_low(self):
        self.assertLess(ga.openness(fist_hand()), 0.15)

    def test_partial_between(self):
        """With fingertips halfway, openness should sit between the two extremes."""
        partial = make_hand(
            wrist=(0.5, 0.8),
            index_mcp=(0.42, 0.62), middle_mcp=(0.5, 0.6),
            ring_mcp=(0.56, 0.61), pinky_mcp=(0.62, 0.63),
            thumb_tip=(0.40, 0.60),
            index_tip=(0.43, 0.53), middle_tip=(0.50, 0.51),
            ring_tip=(0.56, 0.53), pinky_tip=(0.61, 0.56),
        )
        value = ga.openness(partial)
        self.assertGreater(value, 0.1)
        self.assertLess(value, 0.9)

    def test_scale_invariant(self):
        """The user's distance (scaling the whole hand) must not noticeably change openness."""
        base = ga.openness(open_hand())
        small = ga.openness(scale_hand(open_hand(), 0.5))
        self.assertAlmostEqual(base, small, delta=0.05)

    def test_output_in_range(self):
        for hand in (open_hand(), fist_hand()):
            value = ga.openness(hand)
            self.assertGreaterEqual(value, 0.0)
            self.assertLessEqual(value, 1.0)

    def test_degenerate_input_no_nan(self):
        """Degenerate landmarks that all coincide must not produce NaN or out-of-range values."""
        degenerate = [(0.5, 0.5)] * 21
        value = ga.openness(degenerate)
        self.assertEqual(value, value)  # not NaN
        self.assertGreaterEqual(value, 0.0)
        self.assertLessEqual(value, 1.0)

    def test_empty_input(self):
        self.assertEqual(ga.openness(None), 0.0)
        self.assertEqual(ga.openness([]), 0.0)


class TestHandsDistance(unittest.TestCase):
    def test_scale_compensation(self):
        """
        Scaling both hands down (simulating standing farther from the
        camera) should leave the raw distance roughly unchanged, because
        the denominator (palm scale) shrinks with it.
        """
        left = translate_hand(open_hand(), -0.2, 0.0)
        right = translate_hand(open_hand(), 0.2, 0.0)
        raw_near_camera = ga.hands_distance_raw(left, right)
        raw_far_camera = ga.hands_distance_raw(
            scale_hand(left, 0.5), scale_hand(right, 0.5))
        self.assertAlmostEqual(raw_near_camera, raw_far_camera, delta=0.01)

    def test_normalization_clamped(self):
        left = translate_hand(open_hand(), -0.45, 0.0)
        right = translate_hand(open_hand(), 0.45, 0.0)
        value = ga.hands_distance_normalized(left, right, near=1.2, far=7.0)
        self.assertGreaterEqual(value, 0.0)
        self.assertLessEqual(value, 1.0)

    def test_close_hands_near_zero(self):
        """With the hands almost coinciding, the distance should be 0."""
        left = open_hand()
        right = translate_hand(open_hand(), 0.01, 0.0)
        value = ga.hands_distance_normalized(left, right, near=1.2, far=7.0)
        self.assertEqual(value, 0.0)

    def test_monotonic(self):
        """The wider the hands spread, the larger the normalized distance should get."""
        prev = -1.0
        for offset in (0.05, 0.15, 0.25, 0.35, 0.45):
            left = translate_hand(open_hand(), -offset, 0.0)
            right = translate_hand(open_hand(), offset, 0.0)
            value = ga.hands_distance_normalized(left, right, near=0.5, far=7.0)
            self.assertGreaterEqual(value, prev)
            prev = value

    def test_degenerate_no_nan(self):
        degenerate = [(0.5, 0.5)] * 21
        value = ga.hands_distance_normalized(degenerate, degenerate)
        self.assertEqual(value, value)
        self.assertGreaterEqual(value, 0.0)
        self.assertLessEqual(value, 1.0)


class TestPalmPosition(unittest.TestCase):
    def centered_hand(self):
        """A hand whose palm center sits exactly at the frame center (0.5, 0.5)."""
        cx, cy = ga.palm_center(open_hand())
        return translate_hand(open_hand(), 0.5 - cx, 0.5 - cy)

    def test_center(self):
        x, y = ga.palm_position(self.centered_hand())
        self.assertAlmostEqual(x, 0.5, delta=1e-6)
        self.assertAlmostEqual(y, 0.5, delta=1e-6)

    def test_y_points_up(self):
        """Moving the hand toward the top of the frame (smaller MediaPipe y) → output y increases."""
        _, y_mid = ga.palm_position(self.centered_hand())
        _, y_up = ga.palm_position(translate_hand(self.centered_hand(), 0.0, -0.2))
        self.assertGreater(y_up, y_mid)

    def test_x_left_to_right(self):
        x_mid, _ = ga.palm_position(self.centered_hand())
        x_right, _ = ga.palm_position(translate_hand(self.centered_hand(), 0.2, 0.0))
        self.assertGreater(x_right, x_mid)

    def test_margin_reaches_full_scale(self):
        """Once the palm enters the margin it reaches 0/1, and stays clamped in range."""
        hand = translate_hand(self.centered_hand(), -0.45, -0.45)  # top-left corner
        x, y = ga.palm_position(hand, margin=0.1)
        self.assertEqual(x, 0.0)
        self.assertEqual(y, 1.0)

    def test_margin_scaling(self):
        hand = translate_hand(self.centered_hand(), 0.2, 0.0)   # palm x = 0.7
        x0, _ = ga.palm_position(hand, margin=0.0)
        x1, _ = ga.palm_position(hand, margin=0.1)
        self.assertAlmostEqual(x0, 0.7, delta=1e-6)
        self.assertAlmostEqual(x1, 0.75, delta=1e-6)          # (0.7-0.1)/0.8

    def test_invalid_margin_no_crash(self):
        x, y = ga.palm_position(self.centered_hand(), margin=0.6)
        for v in (x, y):
            self.assertGreaterEqual(v, 0.0)
            self.assertLessEqual(v, 1.0)


if __name__ == "__main__":
    unittest.main()
