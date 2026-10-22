#!/bin/bash
# build_macos.sh — package the Tracker into GestureTracker.app with PyInstaller
#
# Usage:
#   .venv/bin/pip install pyinstaller
#   bash build/build_macos.sh
#
# Output: build/dist/GestureTracker.app (unsigned; to distribute it,
# recipients bypass Gatekeeper via right-click → Open, or you sign and
# notarize it yourself)

set -euo pipefail
cd "$(dirname "$0")/.."   # project root

PYINSTALLER=".venv/bin/pyinstaller"
if [ ! -x "$PYINSTALLER" ]; then
  echo "请先安装 PyInstaller： .venv/bin/pip install pyinstaller"
  exit 1
fi

MODEL="gesture-tracker/assets/hand_landmarker.task"
if [ ! -f "$MODEL" ]; then
  echo "模型文件缺失（$MODEL），先运行一次 Tracker 让它自动下载，"
  echo "或手动下载后重试。"
  exit 1
fi

"$PYINSTALLER" --noconfirm --clean \
  --name GestureTracker \
  --windowed \
  --osx-bundle-identifier com.gesturecontrol.tracker \
  --distpath build/dist \
  --workpath build/work \
  --specpath build \
  --add-data "$(pwd)/$MODEL:assets" \
  --collect-all mediapipe \
  gesture-tracker/main.py

# Camera usage description: without this key, macOS denies camera access
# outright and never shows the permission prompt
PLIST="build/dist/GestureTracker.app/Contents/Info.plist"
DESC="GestureTracker 需要使用摄像头进行手势识别"
/usr/libexec/PlistBuddy -c "Add :NSCameraUsageDescription string $DESC" "$PLIST" 2>/dev/null \
  || /usr/libexec/PlistBuddy -c "Set :NSCameraUsageDescription $DESC" "$PLIST"

# Editing Info.plist breaks PyInstaller's ad-hoc signature seal, so on other
# Macs Gatekeeper reports the app as "damaged" with no way to bypass —
# we must re-sign as the final step
codesign --force --deep -s - "build/dist/GestureTracker.app"
codesign --verify --deep --strict "build/dist/GestureTracker.app"

echo
echo "打包完成：build/dist/GestureTracker.app"
echo "命令行验证：build/dist/GestureTracker.app/Contents/MacOS/GestureTracker --test-signal --no-preview"
echo "首次运行请右键 → 打开（未签名应用），并允许摄像头权限。"
