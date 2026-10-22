#!/bin/bash
# run_tracker.command — macOS double-click launcher
# Runs the Tracker with the .venv virtual environment in the project root.
# All paths are quoted, so paths with spaces or non-ASCII characters are safe.

cd "$(dirname "$0")" || exit 1

PYTHON="../.venv/bin/python"
if [ ! -x "$PYTHON" ]; then
  echo "错误：未找到虚拟环境 ../.venv"
  echo "请先在项目根目录执行："
  echo "  python3.11 -m venv .venv"
  echo "  .venv/bin/pip install -r gesture-tracker/requirements.txt"
  read -r -p "按回车退出..."
  exit 1
fi

"$PYTHON" main.py "$@"
status=$?
if [ $status -ne 0 ]; then
  read -r -p "Tracker 异常退出（码 $status），按回车关闭窗口..."
fi
