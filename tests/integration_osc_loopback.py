"""
integration_osc_loopback.py — OSC chain integration test

Flow:
  1. Start an OSC receive server on local port 9010
  2. Start main.py --test-signal --no-preview --port 9010 as a subprocess
  3. Collect 4 seconds of data, then send SIGINT to the subprocess (simulating Ctrl+C)
  4. Verify:
     * all 12 OSC addresses received data
     * every continuous parameter stays within 0.0–1.0
     * fist / detected / status only ever carry 0/1
     * the status=0 sent by the Tracker on exit was received
  5. All checks pass → exit code 0

Run: .venv/bin/python tests/integration_osc_loopback.py
"""

import os
import signal
import subprocess
import sys
import threading
import time
from collections import Counter, defaultdict

from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import ThreadingOSCUDPServer

PORT = 9010
RUN_SECONDS = 4.0

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MAIN = os.path.join(ROOT, "gesture-tracker", "main.py")

EXPECTED_ADDRESSES = [
    "/gesture/left/openness",
    "/gesture/left/fist",
    "/gesture/left/detected",
    "/gesture/right/openness",
    "/gesture/right/fist",
    "/gesture/right/detected",
    "/gesture/hands/distance",
    "/gesture/left/x",
    "/gesture/left/y",
    "/gesture/right/x",
    "/gesture/right/y",
    "/gesture/camera/status",
]
CONTINUOUS = {"/gesture/left/openness", "/gesture/right/openness",
              "/gesture/hands/distance", "/gesture/left/x", "/gesture/left/y",
              "/gesture/right/x", "/gesture/right/y"}
BINARY = {"/gesture/left/fist", "/gesture/right/fist",
          "/gesture/left/detected", "/gesture/right/detected"}


def main():
    counts = Counter()
    values = defaultdict(list)

    def handler(address, *args):
        counts[address] += 1
        if args:
            values[address].append(args[0])

    dispatcher = Dispatcher()
    dispatcher.set_default_handler(handler)
    try:
        server = ThreadingOSCUDPServer(("127.0.0.1", PORT), dispatcher)
    except OSError as e:
        print(f"FAIL: 无法监听端口 {PORT}: {e}")
        return 1
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()

    print(f"[1/3] 监听 127.0.0.1:{PORT}，启动 Tracker（测试信号模式）...")
    proc = subprocess.Popen(
        [sys.executable, MAIN, "--test-signal", "--no-preview",
         "--port", str(PORT)],
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

    time.sleep(RUN_SECONDS)
    print("[2/3] 发送 SIGINT，等待 Tracker 优雅退出...")
    proc.send_signal(signal.SIGINT)
    try:
        output, _ = proc.communicate(timeout=5)
    except subprocess.TimeoutExpired:
        proc.kill()
        output, _ = proc.communicate()
        print("FAIL: Tracker 未能在 5 秒内退出（清理逻辑有问题）")
        print(output)
        return 1

    time.sleep(0.3)  # wait for the final status=0 to arrive
    server.shutdown()
    server.server_close()

    print("[3/3] 校验收到的数据 ...\n")
    failures = []

    for address in EXPECTED_ADDRESSES:
        n = counts.get(address, 0)
        print(f"  {address:32s} {n:5d} 条")
        if n == 0:
            failures.append(f"{address} 未收到任何数据")

    for address in CONTINUOUS:
        bad = [v for v in values[address]
               if not isinstance(v, float) or not (0.0 <= v <= 1.0)]
        if bad:
            failures.append(f"{address} 存在越界/非法值: {bad[:5]}")

    for address in BINARY:
        bad = [v for v in values[address] if v not in (0, 1)]
        if bad:
            failures.append(f"{address} 出现非 0/1 值: {bad[:5]}")

    status_values = values["/gesture/camera/status"]
    if status_values and status_values[-1] != 0:
        failures.append(f"退出时未收到 status=0（最后值 {status_values[-1]}）")
    if 1 not in status_values:
        failures.append("运行期间未收到 status=1 心跳")

    if proc.returncode not in (0, None):
        failures.append(f"Tracker 退出码异常: {proc.returncode}\n{output}")

    print()
    if failures:
        for f in failures:
            print(f"FAIL: {f}")
        return 1
    per_sec = counts["/gesture/left/openness"] / RUN_SECONDS
    print(f"PASS: {len(EXPECTED_ADDRESSES)} 个地址全部正常，连续参数均在 0-1 范围，"
          f"数据速率约 {per_sec:.0f} 条/秒/通道，退出时正确发送 status=0。")
    return 0


if __name__ == "__main__":
    sys.exit(main())
