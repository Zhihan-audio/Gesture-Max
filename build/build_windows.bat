@echo off
rem build_windows.bat — package the Tracker into GestureTracker.exe with PyInstaller
rem
rem Usage:
rem   .venv\Scripts\pip install pyinstaller
rem   build\build_windows.bat
rem
rem Note: this script has not been verified on real Windows hardware;
rem the arguments mirror the macOS version.

cd /d "%~dp0\.."

set PYINSTALLER=.venv\Scripts\pyinstaller.exe
if not exist "%PYINSTALLER%" (
  echo 请先安装 PyInstaller： .venv\Scripts\pip install pyinstaller
  exit /b 1
)
if not exist "gesture-tracker\assets\hand_landmarker.task" (
  echo 模型文件缺失，请先运行一次 Tracker 让它自动下载。
  exit /b 1
)

"%PYINSTALLER%" --noconfirm --clean ^
  --name GestureTracker ^
  --distpath build\dist ^
  --workpath build\work ^
  --specpath build ^
  --add-data "%cd%\gesture-tracker\assets\hand_landmarker.task;assets" ^
  --collect-all mediapipe ^
  gesture-tracker\main.py

echo.
echo 打包完成：build\dist\GestureTracker\GestureTracker.exe
