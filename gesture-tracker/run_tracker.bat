@echo off
rem run_tracker.bat — Windows double-click launcher
rem Runs the Tracker with the .venv virtual environment in the project root.

cd /d "%~dp0"

set PYTHON=..\.venv\Scripts\python.exe
if not exist "%PYTHON%" (
  echo 错误：未找到虚拟环境 ..\.venv
  echo 请先在项目根目录执行：
  echo   py -3.11 -m venv .venv
  echo   .venv\Scripts\pip install -r gesture-tracker\requirements.txt
  pause
  exit /b 1
)

"%PYTHON%" main.py %*
if errorlevel 1 pause
