"""
smoothing.py — data smoothing and stabilization

Contents:
  * ExponentialSmoother — time-constant-based exponential moving average (frame-rate independent)
  * DeadZone           — ignores tiny changes to suppress jitter
  * Hysteresis         — hysteresis switch (used for fist detection, avoids flicker at the threshold)
  * HandLostHandler    — Hold / Zero / Center handling after a hand is lost

None of these classes depend on MediaPipe / OpenCV, so they can be
unit-tested in isolation.
"""

import math


def clamp01(x: float) -> float:
    """Clamp a value to [0, 1], safely folding NaN/inf to 0."""
    if x != x or x in (float("inf"), float("-inf")):  # NaN check
        return 0.0
    return min(max(x, 0.0), 1.0)


class ExponentialSmoother:
    """
    Frame-rate-independent exponential moving average.

    alpha = 1 - exp(-dt / tau), where tau is the smoothing time constant
    in seconds. tau=0 means pass-through (no smoothing). Abnormal dt
    (<=0 or very large) is guarded against.
    """

    def __init__(self, smoothing_ms: float = 100.0):
        self.set_smoothing(smoothing_ms)
        self._value = None  # adopt the first sample directly, avoiding a slow climb from 0

    def set_smoothing(self, smoothing_ms: float):
        self._tau = max(float(smoothing_ms), 0.0) / 1000.0

    def reset(self, value: float = None):
        self._value = value

    @property
    def value(self):
        return self._value

    def update(self, sample: float, dt: float) -> float:
        """Feed a new sample and the time since the last update (seconds); returns the smoothed value."""
        sample = float(sample)
        if self._value is None:
            self._value = sample
            return self._value
        if self._tau <= 0.0:
            self._value = sample
            return self._value
        # dt guard: don't let alpha blow up after a pause or stall
        dt = min(max(dt, 0.0), 1.0)
        alpha = 1.0 - math.exp(-dt / self._tau)
        self._value += alpha * (sample - self._value)
        return self._value


class DeadZone:
    """
    Dead-zone filter: the output holds still while the change is smaller
    than threshold. Suppresses tiny jitter while a hand is held steady
    and cuts pointless OSC traffic.
    """

    def __init__(self, threshold: float = 0.01):
        self.threshold = max(float(threshold), 0.0)
        self._output = None

    def reset(self):
        self._output = None

    def process(self, value: float) -> float:
        if self._output is None or abs(value - self._output) >= self.threshold:
            self._output = value
        return self._output


class Hysteresis:
    """
    Hysteresis switch (Schmitt trigger).

    Value below enter_threshold → state 1 (e.g. entering a fist)
    Value above exit_threshold  → state 0 (e.g. leaving a fist)
    Between the two thresholds → keep the current state, avoiding flicker.
    """

    def __init__(self, enter_threshold: float = 0.25, exit_threshold: float = 0.40):
        self.set_thresholds(enter_threshold, exit_threshold)
        self.state = 0

    def set_thresholds(self, enter_threshold: float, exit_threshold: float):
        self.enter_threshold = float(enter_threshold)
        # The exit threshold must exceed the enter threshold, or hysteresis breaks
        self.exit_threshold = max(float(exit_threshold), self.enter_threshold + 0.01)

    def reset(self):
        self.state = 0

    def update(self, value: float) -> int:
        if self.state == 0 and value < self.enter_threshold:
            self.state = 1
        elif self.state == 1 and value > self.exit_threshold:
            self.state = 0
        return self.state


class HandLostHandler:
    """
    Hand-lost handling.

    Rules:
      * lost for < timeout: every mode holds the last valid value (Hold)
      * lost for >= timeout:
          - hold   : keep holding the last valid value
          - zero   : glide linearly to 0.0 over glide_ms
          - center : glide linearly to 0.5 over glide_ms
      * hand reappears: live data resumes immediately
    """

    TARGETS = {"hold": None, "zero": 0.0, "center": 0.5}

    def __init__(self, mode: str = "hold", timeout_ms: float = 1000.0,
                 glide_ms: float = 800.0):
        self.mode = mode if mode in self.TARGETS else "hold"
        self.timeout = max(timeout_ms, 0.0) / 1000.0
        self.glide = max(glide_ms, 50.0) / 1000.0
        self._lost_time = 0.0        # time lost so far (seconds)
        self._last_value = 0.0       # last valid value
        self._glide_start = 0.0      # value at the moment the glide started

    def update(self, value, present: bool, dt: float) -> float:
        """
        Called every frame. value is the current frame's computed value
        (ignored when present is False), present says whether this hand
        was detected this frame, dt is the frame interval in seconds.
        Returns the value to output.
        """
        dt = min(max(dt, 0.0), 1.0)
        if present:
            self._lost_time = 0.0
            self._last_value = clamp01(value)
            return self._last_value

        self._lost_time += dt
        target = self.TARGETS.get(self.mode)

        # Not yet timed out, or hold mode: keep the last valid value
        if target is None or self._lost_time < self.timeout:
            self._glide_start = self._last_value
            return self._last_value

        # After the timeout, glide linearly to the target over the glide time
        progress = min((self._lost_time - self.timeout) / self.glide, 1.0)
        return self._glide_start + (target - self._glide_start) * progress


class ChannelPipeline:
    """
    Full processing chain for one continuous parameter:
    lost handling → exponential smoothing → dead zone → clamp.
    Each output channel (Left Open / Right Open / Hand Distance) owns one instance.
    """

    def __init__(self, smoothing_ms: float, deadzone: float,
                 lost_mode: str, lost_timeout_ms: float, lost_glide_ms: float):
        self.lost = HandLostHandler(lost_mode, lost_timeout_ms, lost_glide_ms)
        self.smoother = ExponentialSmoother(smoothing_ms)
        self.deadzone = DeadZone(deadzone)

    def update(self, raw_value, present: bool, dt: float) -> float:
        held = self.lost.update(raw_value, present, dt)
        smoothed = self.smoother.update(held, dt)
        return clamp01(self.deadzone.process(smoothed))
