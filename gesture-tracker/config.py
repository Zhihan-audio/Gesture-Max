"""
config.py — Gesture Tracker configuration management

Configuration precedence (lowest to highest):
  1. built-in defaults (DEFAULTS)
  2. config.json (same directory as this file, loaded if present)
  3. command-line arguments (--port etc.)

Every numeric value is validated (clamped) on load, so downstream modules
always receive values within a sane range.
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, asdict, fields

# The config file lives in the gesture-tracker directory (same directory as
# this script, safe for paths containing spaces or non-ASCII characters)
CONFIG_DIR = os.path.dirname(os.path.abspath(__file__))
CONFIG_PATH = os.path.join(CONFIG_DIR, "config.json")

# Hand-lost handling modes
HAND_LOST_MODES = ("hold", "zero", "center")


@dataclass
class Config:
    # ---- OSC ----
    osc_ip: str = "127.0.0.1"
    osc_port: int = 9000            # use 9001/9002… for multiple instances to avoid conflicts
    status_interval_ms: int = 500   # /gesture/camera/status heartbeat interval

    # ---- Camera ----
    camera_index: int = 0
    camera_name: str = ""           # name substring match (e.g. "FaceTime"), overrides index
    avoid_continuity_camera: bool = True  # auto-skip iPhone Continuity / virtual cameras
    camera_width: int = 640         # 640x480 is plenty for MediaPipe and keeps latency low
    camera_height: int = 480
    target_fps: int = 30
    flip_horizontal: bool = True    # mirror (selfie view); MediaPipe handedness depends on it

    # ---- MediaPipe ----
    min_detection_confidence: float = 0.6
    min_tracking_confidence: float = 0.5
    max_num_hands: int = 2

    # ---- Smoothing / stability ----
    smoothing_ms: float = 100.0     # exponential smoothing time constant, 0–1000 ms
    deadzone: float = 0.01          # ignore changes smaller than this
    hand_lost_mode: str = "hold"    # hold / zero / center
    lost_timeout_ms: float = 1000.0 # time lost before the mode kicks in
    lost_glide_ms: float = 800.0    # glide duration for zero/center modes

    # ---- Gesture thresholds ----
    fist_enter_threshold: float = 0.25  # openness below this → fist (hysteresis lower bound)
    fist_exit_threshold: float = 0.40   # openness above this → exit fist (hysteresis upper bound)

    # ---- Hand-distance calibration (unit: multiples of average palm width, scale-compensated) ----
    distance_near: float = 1.2      # at or below this distance → 0.0
    distance_far: float = 7.0       # at or beyond this distance → 1.0

    # ---- Palm position x/y calibration (fraction of the frame) ----
    position_margin: float = 0.1    # frame border: output hits 0/1 once the palm enters it

    # ---- Run modes ----
    preview: bool = True            # show the preview window
    debug: bool = False             # debug mode: print a status summary once per second
    test_signal: bool = False       # camera-less test mode: send synthetic sine data

    def clamp(self):
        """Clamp every parameter to its legal range so a bad config file cannot break the runtime."""
        self.osc_port = int(min(max(self.osc_port, 1024), 65535))
        self.camera_index = max(int(self.camera_index), 0)
        self.camera_width = int(min(max(self.camera_width, 160), 3840))
        self.camera_height = int(min(max(self.camera_height, 120), 2160))
        self.target_fps = int(min(max(self.target_fps, 5), 120))
        self.min_detection_confidence = min(max(self.min_detection_confidence, 0.0), 1.0)
        self.min_tracking_confidence = min(max(self.min_tracking_confidence, 0.0), 1.0)
        self.max_num_hands = int(min(max(self.max_num_hands, 1), 2))
        self.smoothing_ms = min(max(self.smoothing_ms, 0.0), 1000.0)
        self.deadzone = min(max(self.deadzone, 0.0), 0.2)
        if self.hand_lost_mode not in HAND_LOST_MODES:
            self.hand_lost_mode = "hold"
        self.lost_timeout_ms = min(max(self.lost_timeout_ms, 0.0), 10000.0)
        self.lost_glide_ms = min(max(self.lost_glide_ms, 50.0), 5000.0)
        self.fist_enter_threshold = min(max(self.fist_enter_threshold, 0.0), 1.0)
        # The exit threshold must exceed the enter threshold for hysteresis to work
        self.fist_exit_threshold = min(max(self.fist_exit_threshold,
                                           self.fist_enter_threshold + 0.05), 1.0)
        self.distance_near = max(self.distance_near, 0.0)
        self.distance_far = max(self.distance_far, self.distance_near + 0.5)
        self.position_margin = min(max(self.position_margin, 0.0), 0.4)
        self.status_interval_ms = int(min(max(self.status_interval_ms, 100), 5000))
        return self


def load_config_file(cfg: Config, path: str = CONFIG_PATH) -> Config:
    """Load config from the JSON file; keep defaults and warn if the file is missing or corrupt."""
    if not os.path.exists(path):
        return cfg
    try:
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        valid_keys = {f.name for f in fields(Config)}
        for key, value in data.items():
            if key in valid_keys:
                setattr(cfg, key, value)
            else:
                print(f"[config] 忽略未知配置项: {key}", file=sys.stderr)
    except (json.JSONDecodeError, OSError) as e:
        print(f"[config] 配置文件读取失败，使用默认值: {e}", file=sys.stderr)
    return cfg


def save_config_file(cfg: Config, path: str = CONFIG_PATH):
    """Write the current config back to the JSON file (for manual editing or UI-driven persistence)."""
    try:
        with open(path, "w", encoding="utf-8") as f:
            json.dump(asdict(cfg), f, indent=2, ensure_ascii=False)
    except OSError as e:
        print(f"[config] 配置文件写入失败: {e}", file=sys.stderr)


def parse_args(argv=None) -> Config:
    """Load the config file + parse command-line arguments; return the final Config."""
    cfg = load_config_file(Config())

    parser = argparse.ArgumentParser(
        prog="gesture-tracker",
        description="Gesture Control M4L — MediaPipe 手势识别 OSC Tracker",
    )
    parser.add_argument("--port", type=int, help="OSC 发送端口 (默认 %d)" % cfg.osc_port)
    parser.add_argument("--ip", type=str, help="OSC 目标 IP (默认 %s)" % cfg.osc_ip)
    parser.add_argument("--camera", type=int, help="摄像头索引 (默认 %d)" % cfg.camera_index)
    parser.add_argument("--camera-name", type=str,
                        help="按名称选择摄像头（子串匹配，如 \"FaceTime\"）")
    parser.add_argument("--list-cameras", action="store_true",
                        help="列出所有摄像头及其索引后退出")
    parser.add_argument("--width", type=int, help="摄像头宽度")
    parser.add_argument("--height", type=int, help="摄像头高度")
    parser.add_argument("--fps", type=int, help="目标帧率")
    parser.add_argument("--smoothing", type=float, help="平滑时间 ms (0-1000)")
    parser.add_argument("--deadzone", type=float, help="Dead Zone (默认 %.2f)" % cfg.deadzone)
    parser.add_argument("--lost-mode", choices=HAND_LOST_MODES, help="手部丢失模式")
    parser.add_argument("--no-preview", action="store_true", help="不显示 Preview Window")
    parser.add_argument("--preview", action="store_true", help="显示 Preview Window")
    parser.add_argument("--debug", action="store_true", help="Debug 模式（每秒打印状态）")
    parser.add_argument("--test-signal", action="store_true",
                        help="测试模式：不开摄像头，发送合成数据用于验证 OSC 链路")
    parser.add_argument("--save-config", action="store_true",
                        help="把最终配置写入 config.json 后正常运行")
    args = parser.parse_args(argv)

    if args.port is not None:
        cfg.osc_port = args.port
    if args.ip is not None:
        cfg.osc_ip = args.ip
    if args.camera is not None:
        cfg.camera_index = args.camera
    # Runtime-only attributes (not written to config.json): explicit index flag / list-only flag
    cfg.camera_index_explicit = args.camera is not None
    cfg.list_cameras = args.list_cameras
    if args.camera_name is not None:
        cfg.camera_name = args.camera_name
    if args.width is not None:
        cfg.camera_width = args.width
    if args.height is not None:
        cfg.camera_height = args.height
    if args.fps is not None:
        cfg.target_fps = args.fps
    if args.smoothing is not None:
        cfg.smoothing_ms = args.smoothing
    if args.deadzone is not None:
        cfg.deadzone = args.deadzone
    if args.lost_mode is not None:
        cfg.hand_lost_mode = args.lost_mode
    if args.no_preview:
        cfg.preview = False
    elif args.preview:
        cfg.preview = True
    if args.debug:
        cfg.debug = True
    if args.test_signal:
        cfg.test_signal = True

    cfg.clamp()
    if args.save_config:
        save_config_file(cfg)
    return cfg
