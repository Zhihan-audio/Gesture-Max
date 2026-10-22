"""
main.py — Gesture Tracker main program

Pipeline:
  camera capture → MediaPipe hand tracking → gesture geometry analysis
  → lost handling / smoothing / dead zone → OSC to Max for Live → (optional) preview window

Usage:
  python main.py                     # default: camera + preview window + OSC → 127.0.0.1:9000
  python main.py --no-preview        # no preview window (best performance)
  python main.py --test-signal      # no camera; send a synthetic sine signal (verifies the OSC chain)
  python main.py --port 9001        # use a different port per instance
  python main.py --debug            # print a status summary once per second

Quit with Ctrl+C or by pressing q / ESC in the preview window; on exit the
camera is released and /gesture/camera/status 0 is sent automatically.
"""

import math
import signal
import sys
import time
from dataclasses import dataclass, field

from config import parse_args, Config
from smoothing import ChannelPipeline, Hysteresis, HandLostHandler
import gesture_analysis as ga
from osc_sender import OSCSender, STATUS_RUNNING, STATUS_ERROR


@dataclass
class TrackerState:
    """Full output state for the current frame (shared by preview and debug)."""
    left_open: float = 0.0
    left_fist: int = 0
    left_detected: int = 0
    right_open: float = 0.0
    right_fist: int = 0
    right_detected: int = 0
    distance: float = 0.0
    # Palm position 0–1 (x: left→right; y: bottom→top)
    left_x: float = 0.0
    left_y: float = 0.0
    right_x: float = 0.0
    right_y: float = 0.0
    fps: float = 0.0
    osc_target: str = ""
    # Palm pixel coordinates (preview drawing only; None = not detected)
    left_palm_px: tuple = None
    right_palm_px: tuple = None


class GestureProcessor:
    """
    Converts each frame's raw landmarks into the final output channels.
    Owns all smoothing / hysteresis / lost-handling state.
    """

    def __init__(self, cfg: Config):
        self.cfg = cfg

        def make_pipeline():
            return ChannelPipeline(cfg.smoothing_ms, cfg.deadzone,
                                   cfg.hand_lost_mode, cfg.lost_timeout_ms,
                                   cfg.lost_glide_ms)

        self.left_open_pipe = make_pipeline()
        self.right_open_pipe = make_pipeline()
        self.distance_pipe = make_pipeline()
        self.left_x_pipe = make_pipeline()
        self.left_y_pipe = make_pipeline()
        self.right_x_pipe = make_pipeline()
        self.right_y_pipe = make_pipeline()
        self.left_fist_hyst = Hysteresis(cfg.fist_enter_threshold,
                                         cfg.fist_exit_threshold)
        self.right_fist_hyst = Hysteresis(cfg.fist_enter_threshold,
                                          cfg.fist_exit_threshold)
        # fist is a binary switch and skips the smoothing pipeline; on hand
        # loss it follows each openness channel's hold logic: the hysteresis
        # state is simply not updated while the hand is lost, so it naturally
        # keeps its last state.

    def update(self, left_lm, right_lm, dt: float, state: TrackerState):
        """left_lm / right_lm are 21-point lists or None. Results are written to state."""
        left_present = left_lm is not None
        right_present = right_lm is not None
        state.left_detected = 1 if left_present else 0
        state.right_detected = 1 if right_present else 0

        # ---- Openness ----
        raw_left_open = ga.openness(left_lm) if left_present else 0.0
        raw_right_open = ga.openness(right_lm) if right_present else 0.0
        state.left_open = self.left_open_pipe.update(raw_left_open, left_present, dt)
        state.right_open = self.right_open_pipe.update(raw_right_open, right_present, dt)

        # ---- Fist (hysteresis on smoothed openness; only updated while the hand is present) ----
        if left_present:
            self.left_fist_hyst.update(state.left_open)
        if right_present:
            self.right_fist_hyst.update(state.right_open)
        state.left_fist = self.left_fist_hyst.state
        state.right_fist = self.right_fist_hyst.state

        # ---- Hand distance (requires both hands present) ----
        both = left_present and right_present
        raw_dist = (ga.hands_distance_normalized(
            left_lm, right_lm, self.cfg.distance_near, self.cfg.distance_far)
            if both else 0.0)
        state.distance = self.distance_pipe.update(raw_dist, both, dt)

        # ---- Palm position x/y (lost handling identical to openness: hold / zero / center) ----
        margin = self.cfg.position_margin
        lx, ly = ga.palm_position(left_lm, margin) if left_present else (0.0, 0.0)
        rx, ry = ga.palm_position(right_lm, margin) if right_present else (0.0, 0.0)
        state.left_x = self.left_x_pipe.update(lx, left_present, dt)
        state.left_y = self.left_y_pipe.update(ly, left_present, dt)
        state.right_x = self.right_x_pipe.update(rx, right_present, dt)
        state.right_y = self.right_y_pipe.update(ry, right_present, dt)


def send_state(osc: OSCSender, state: TrackerState):
    """Send all gesture channels for one frame (shared by camera and test modes)."""
    osc.send_gestures(state.left_open, state.left_fist, state.left_detected,
                      state.right_open, state.right_fist, state.right_detected,
                      state.distance, state.left_x, state.left_y,
                      state.right_x, state.right_y)


def open_camera(cfg: Config):
    """
    Open the camera, with smart device selection (skipping iPhone
    Continuity Camera), index fallback and clear error messages.
    Returns a cv2.VideoCapture; returns None if everything fails
    (no exceptions, no crash).
    """
    import cv2
    from camera_selection import resolve_camera_order, format_camera_table

    indices, cams = resolve_camera_order(cfg)
    if cams:
        print("[camera] 检测到摄像头:")
        print(format_camera_table(cams, chosen_index=indices[0]))

    # The AVFoundation backend is the most reliable on macOS; use the default elsewhere
    backend = cv2.CAP_AVFOUNDATION if sys.platform == "darwin" else cv2.CAP_ANY
    tried = []
    for idx in indices:
        try:
            cap = cv2.VideoCapture(idx, backend)
            if cap.isOpened():
                cap.set(cv2.CAP_PROP_FRAME_WIDTH, cfg.camera_width)
                cap.set(cv2.CAP_PROP_FRAME_HEIGHT, cfg.camera_height)
                cap.set(cv2.CAP_PROP_FPS, cfg.target_fps)
                ok, _ = cap.read()  # Actually read a frame to confirm (isOpened can be wrong)
                if ok:
                    if idx != indices[0]:
                        print(f"[camera] 索引 {indices[0]} 不可用，"
                              f"已回退到索引 {idx}")
                    return cap
            cap.release()
        except cv2.error as e:
            print(f"[camera] 打开索引 {idx} 出错: {e}", file=sys.stderr)
        tried.append(idx)

    print(f"[camera] 错误：无法打开任何摄像头（尝试了索引 {tried}）。\n"
          "  * macOS: 请在 系统设置 → 隐私与安全性 → 摄像头 中允许终端/本程序\n"
          "  * 确认没有其他程序正在占用摄像头\n"
          "  * 可用 --camera N 指定其他摄像头", file=sys.stderr)
    return None


def run_camera_loop(cfg: Config, osc: OSCSender):
    """Normal mode: camera + MediaPipe main loop. Returns the process exit code."""
    import cv2
    from hand_tracker import HandTracker
    from preview import PreviewWindow

    cap = open_camera(cfg)
    if cap is None:
        osc.send_status(STATUS_ERROR)
        return 1

    try:
        tracker = HandTracker(cfg.max_num_hands, cfg.min_detection_confidence,
                              cfg.min_tracking_confidence)
    except Exception as e:
        print(f"[tracker] MediaPipe 初始化失败: {e}", file=sys.stderr)
        cap.release()
        osc.send_status(STATUS_ERROR)
        return 1

    processor = GestureProcessor(cfg)
    preview = PreviewWindow(tracker) if cfg.preview else None
    state = TrackerState(osc_target=f"{osc.ip}:{osc.port}")

    frame_interval = 1.0 / cfg.target_fps
    last_time = time.monotonic()
    last_status_time = 0.0
    last_debug_time = 0.0
    fps_smooth = 0.0
    consecutive_read_failures = 0

    print(f"[tracker] 运行中 → OSC {osc.ip}:{osc.port}  "
          f"(预览: {'开' if cfg.preview else '关'}，q/ESC 或 Ctrl+C 退出)")

    running = True
    while running:
        loop_start = time.monotonic()

        ok, frame = cap.read()
        if not ok or frame is None:
            consecutive_read_failures += 1
            if consecutive_read_failures > 60:  # ~2 s of continuous failure = camera disconnected
                print("[camera] 摄像头连续读取失败，退出。", file=sys.stderr)
                osc.send_status(STATUS_ERROR)
                break
            time.sleep(0.05)
            continue
        consecutive_read_failures = 0

        if cfg.flip_horizontal:
            frame = cv2.flip(frame, 1)  # mirror → selfie view; hand labels match the user

        now = time.monotonic()
        dt = now - last_time
        last_time = now
        if dt > 0:
            fps_smooth = fps_smooth * 0.9 + (1.0 / dt) * 0.1
        state.fps = fps_smooth

        # ---- Tracking + gesture computation ----
        hands = tracker.process(frame)
        processor.update(hands["left"], hands["right"], dt, state)

        # Palm pixel coordinates (for the preview)
        h, w = frame.shape[:2]
        for side, key in (("left_palm_px", "left"), ("right_palm_px", "right")):
            if hands[key] is not None:
                cx, cy = ga.palm_center(hands[key])
                setattr(state, side, (int(cx * w), int(cy * h)))
            else:
                setattr(state, side, None)

        # ---- OSC output ----
        send_state(osc, state)
        if now - last_status_time >= cfg.status_interval_ms / 1000.0:
            osc.send_status(STATUS_RUNNING)
            last_status_time = now

        # ---- Debug summary (once per second, no console spam) ----
        if cfg.debug and now - last_debug_time >= 1.0:
            print(f"[debug] fps={state.fps:5.1f} "
                  f"L(open={state.left_open:.2f} fist={state.left_fist} "
                  f"det={state.left_detected} "
                  f"xy={state.left_x:.2f},{state.left_y:.2f}) "
                  f"R(open={state.right_open:.2f} fist={state.right_fist} "
                  f"det={state.right_detected} "
                  f"xy={state.right_x:.2f},{state.right_y:.2f}) "
                  f"dist={state.distance:.2f}")
            last_debug_time = now

        # ---- Preview ----
        if preview is not None:
            running = preview.render(frame, state, hands)

        # ---- Frame-rate limiting (saves CPU when tracking outpaces the target fps) ----
        elapsed = time.monotonic() - loop_start
        if elapsed < frame_interval:
            time.sleep(frame_interval - elapsed)

    # ---- Cleanup ----
    if preview is not None:
        preview.close()
    tracker.close()
    cap.release()
    return 0


def run_test_signal_loop(cfg: Config, osc: OSCSender):
    """
    Test mode: no camera; send synthetic data.
    Verifies the OSC → Max chain on machines without a camera or permission:
      * left/right openness: sine waves with different periods
      * fist: 1 while openness < 0.25
      * distance: slow triangle wave
      * palm x/y: left hand draws a circle (5 s per loop), right hand a
        figure eight (7 s per loop)
    """
    print(f"[test] 测试信号模式 → OSC {osc.ip}:{osc.port}（Ctrl+C 退出）")
    state = TrackerState(osc_target=f"{osc.ip}:{osc.port}")
    frame_interval = 1.0 / cfg.target_fps
    start = time.monotonic()
    last_status_time = 0.0
    last_debug_time = 0.0

    while True:
        now = time.monotonic()
        t = now - start
        state.left_open = 0.5 + 0.5 * math.sin(t * 2.0 * math.pi / 4.0)   # 4 s period
        state.right_open = 0.5 + 0.5 * math.sin(t * 2.0 * math.pi / 6.0)  # 6 s period
        state.left_fist = 1 if state.left_open < 0.25 else 0
        state.right_fist = 1 if state.right_open < 0.25 else 0
        state.left_detected = 1
        state.right_detected = 1
        tri = (t % 10.0) / 10.0                                            # 10 s period
        state.distance = tri * 2.0 if tri < 0.5 else (1.0 - tri) * 2.0
        a = t * 2.0 * math.pi / 5.0
        state.left_x = 0.5 + 0.4 * math.cos(a)
        state.left_y = 0.5 + 0.4 * math.sin(a)
        b = t * 2.0 * math.pi / 7.0
        state.right_x = 0.5 + 0.4 * math.sin(b)
        state.right_y = 0.5 + 0.4 * math.sin(2.0 * b)

        send_state(osc, state)
        if now - last_status_time >= cfg.status_interval_ms / 1000.0:
            osc.send_status(STATUS_RUNNING)
            last_status_time = now
        if cfg.debug and now - last_debug_time >= 1.0:
            print(f"[debug] L={state.left_open:.2f} R={state.right_open:.2f} "
                  f"dist={state.distance:.2f} "
                  f"Lxy={state.left_x:.2f},{state.left_y:.2f} "
                  f"Rxy={state.right_x:.2f},{state.right_y:.2f}")
            last_debug_time = now

        time.sleep(frame_interval)


def main():
    cfg = parse_args()

    # --list-cameras: only list devices and indices; no camera, no OSC
    if getattr(cfg, "list_cameras", False):
        from camera_selection import resolve_camera_order, format_camera_table
        indices, cams = resolve_camera_order(cfg)
        if cams:
            print("检测到的摄像头（编号即 --camera 使用的索引）:")
            print(format_camera_table(cams, chosen_index=indices[0]))
            print("\n标记「← 使用」的是当前配置下将被打开的设备。")
        else:
            print("无法枚举设备名称（非 macOS 或未安装 pyobjc）。\n"
                  "请用 --camera 0/1/2 逐个尝试。")
        return 0

    try:
        osc = OSCSender(cfg.osc_ip, cfg.osc_port)
    except OSError:
        return 1

    # Ctrl+C / SIGTERM → route through KeyboardInterrupt into the shared cleanup path
    signal.signal(signal.SIGTERM, lambda *_: (_ for _ in ()).throw(KeyboardInterrupt))

    exit_code = 0
    try:
        if cfg.test_signal:
            run_test_signal_loop(cfg, osc)
        else:
            exit_code = run_camera_loop(cfg, osc)
    except KeyboardInterrupt:
        print("\n[tracker] 收到退出信号。")
    except Exception as e:
        # Safety net: every unexpected exception must still reach the cleanup
        # path — we can never leave the camera held open
        print(f"[tracker] 未预期异常: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        exit_code = 1
    finally:
        osc.close()  # sends status=0 and closes the socket
        print("[tracker] 已退出，摄像头与端口已释放。")
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
