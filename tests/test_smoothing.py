"""
test_smoothing.py — unit tests for smoothing / hysteresis / lost handling

Run: python -m unittest discover tests
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))), "gesture-tracker"))

from smoothing import (ExponentialSmoother, DeadZone, Hysteresis,
                       HandLostHandler, ChannelPipeline, clamp01)


class TestClamp01(unittest.TestCase):
    def test_range(self):
        self.assertEqual(clamp01(-0.5), 0.0)
        self.assertEqual(clamp01(1.5), 1.0)
        self.assertEqual(clamp01(0.42), 0.42)

    def test_nan_inf(self):
        self.assertEqual(clamp01(float("nan")), 0.0)
        self.assertEqual(clamp01(float("inf")), 0.0)
        self.assertEqual(clamp01(float("-inf")), 0.0)


class TestExponentialSmoother(unittest.TestCase):
    def test_first_sample_passthrough(self):
        s = ExponentialSmoother(100.0)
        self.assertEqual(s.update(0.7, 1 / 30), 0.7)

    def test_zero_tau_passthrough(self):
        s = ExponentialSmoother(0.0)
        s.update(0.0, 1 / 30)
        self.assertEqual(s.update(1.0, 1 / 30), 1.0)

    def test_converges(self):
        """A step input should converge to the target within a few time constants."""
        s = ExponentialSmoother(100.0)
        s.update(0.0, 1 / 30)
        value = 0.0
        for _ in range(30):  # 1 second = 10 time constants
            value = s.update(1.0, 1 / 30)
        self.assertGreater(value, 0.99)

    def test_smooths_step(self):
        """With smoothing on, the first frame after a step must not reach the target."""
        s = ExponentialSmoother(200.0)
        s.update(0.0, 1 / 30)
        self.assertLess(s.update(1.0, 1 / 30), 0.5)


class TestDeadZone(unittest.TestCase):
    def test_small_change_held(self):
        dz = DeadZone(0.01)
        self.assertEqual(dz.process(0.5), 0.5)
        self.assertEqual(dz.process(0.505), 0.5)   # below the dead zone → hold
        self.assertEqual(dz.process(0.52), 0.52)   # beyond the dead zone → update


class TestHysteresis(unittest.TestCase):
    def test_enter_exit(self):
        h = Hysteresis(0.25, 0.40)
        self.assertEqual(h.update(0.8), 0)   # open → not a fist
        self.assertEqual(h.update(0.2), 1)   # below 0.25 → fist
        self.assertEqual(h.update(0.3), 1)   # in between → stay a fist
        self.assertEqual(h.update(0.45), 0)  # above 0.40 → exit
        self.assertEqual(h.update(0.35), 0)  # in between → stay not a fist

    def test_no_flicker_at_boundary(self):
        """The state must not flip back and forth while the value jitters around one threshold."""
        h = Hysteresis(0.25, 0.40)
        h.update(0.2)  # enter the fist state
        for value in (0.26, 0.24, 0.27, 0.25, 0.28):
            self.assertEqual(h.update(value), 1)

    def test_invalid_thresholds_fixed(self):
        h = Hysteresis(0.5, 0.3)  # exit threshold below enter threshold → auto-corrected
        self.assertGreater(h.exit_threshold, h.enter_threshold)


class TestHandLostHandler(unittest.TestCase):
    DT = 1 / 30

    def _run_lost(self, handler, seconds):
        value = None
        for _ in range(int(seconds / self.DT)):
            value = handler.update(0.0, present=False, dt=self.DT)
        return value

    def test_hold_before_timeout_all_modes(self):
        """Before the timeout, every mode must hold the last valid value."""
        for mode in ("hold", "zero", "center"):
            h = HandLostHandler(mode, timeout_ms=1000, glide_ms=500)
            h.update(0.8, present=True, dt=self.DT)
            value = self._run_lost(h, 0.5)  # lost 0.5 s < 1 s timeout
            self.assertEqual(value, 0.8, f"mode={mode}")

    def test_hold_after_timeout(self):
        h = HandLostHandler("hold", timeout_ms=1000, glide_ms=500)
        h.update(0.8, present=True, dt=self.DT)
        self.assertEqual(self._run_lost(h, 3.0), 0.8)

    def test_zero_glides_to_zero(self):
        h = HandLostHandler("zero", timeout_ms=1000, glide_ms=500)
        h.update(0.8, present=True, dt=self.DT)
        self.assertAlmostEqual(self._run_lost(h, 2.0), 0.0, delta=0.01)

    def test_center_glides_to_half(self):
        h = HandLostHandler("center", timeout_ms=1000, glide_ms=500)
        h.update(0.8, present=True, dt=self.DT)
        self.assertAlmostEqual(self._run_lost(h, 2.0), 0.5, delta=0.01)

    def test_glide_is_gradual(self):
        """After the timeout, zero mode should fall off gradually, not jump to 0."""
        h = HandLostHandler("zero", timeout_ms=1000, glide_ms=800)
        h.update(0.8, present=True, dt=self.DT)
        mid = self._run_lost(h, 1.4)  # 0.4 s after the timeout, glide about halfway
        self.assertGreater(mid, 0.2)
        self.assertLess(mid, 0.7)

    def test_reappear_restores(self):
        h = HandLostHandler("zero", timeout_ms=1000, glide_ms=500)
        h.update(0.8, present=True, dt=self.DT)
        self._run_lost(h, 3.0)
        self.assertEqual(h.update(0.6, present=True, dt=self.DT), 0.6)


class TestChannelPipeline(unittest.TestCase):
    def test_output_always_in_range(self):
        p = ChannelPipeline(100.0, 0.01, "hold", 1000.0, 500.0)
        for raw in (-5.0, 0.3, 2.0, float("nan"), 0.7):
            value = p.update(raw, present=True, dt=1 / 30)
            self.assertGreaterEqual(value, 0.0)
            self.assertLessEqual(value, 1.0)


if __name__ == "__main__":
    unittest.main()
