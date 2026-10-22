"""
osc_monitor.py — OSC receive monitor (test tool)

Listens on the given port and prints incoming /gesture/* messages, to
verify the Tracker's OSC output without Max.

Usage:
  python tests/osc_monitor.py                 # listen on 9000, print continuously
  python tests/osc_monitor.py --port 9001
  python tests/osc_monitor.py --seconds 5     # exit after 5 seconds and print statistics
  python tests/osc_monitor.py --quiet         # print only the statistics, not each message
"""

import argparse
import sys
import threading
from collections import Counter

try:
    from pythonosc.dispatcher import Dispatcher
    from pythonosc.osc_server import ThreadingOSCUDPServer
except ImportError:
    print("需要 python-osc：pip install python-osc", file=sys.stderr)
    sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description="OSC 接收监视器")
    parser.add_argument("--port", type=int, default=9000)
    parser.add_argument("--seconds", type=float, default=0,
                        help="运行时长，0 表示一直运行")
    parser.add_argument("--quiet", action="store_true", help="不逐条打印消息")
    args = parser.parse_args()

    counts = Counter()
    latest = {}

    def handler(address, *osc_args):
        counts[address] += 1
        latest[address] = osc_args[0] if osc_args else None
        if not args.quiet:
            print(f"{address}  {osc_args}")

    dispatcher = Dispatcher()
    dispatcher.set_default_handler(handler)

    try:
        server = ThreadingOSCUDPServer(("127.0.0.1", args.port), dispatcher)
    except OSError as e:
        print(f"错误：无法监听端口 {args.port}（可能已被占用）: {e}", file=sys.stderr)
        sys.exit(1)

    print(f"[monitor] 监听 127.0.0.1:{args.port} ...", flush=True)

    if args.seconds > 0:
        timer = threading.Timer(args.seconds, server.shutdown)
        timer.daemon = True
        timer.start()

    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()

    print("\n===== 统计 =====")
    if not counts:
        print("未收到任何 OSC 消息。")
        sys.exit(2)
    for address in sorted(counts):
        print(f"{address:32s}  {counts[address]:5d} 条   最新值: {latest[address]}")
    sys.exit(0)


if __name__ == "__main__":
    main()
