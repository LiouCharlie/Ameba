@echo off
setlocal
chcp 65001 >nul
set "PYTHONUTF8=1"
title Ameba Mini Redesigned Voice Controller
cd /d "%~dp0\.."

echo ========================================
echo  Ameba Mini - Redesigned Web Controller
echo ========================================
echo.
echo Open this URL after startup:
echo http://localhost:8000/webUI/
echo.

where python >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Python was not found.
  goto :failed
)

python -c "import serial" >nul 2>&1
if errorlevel 1 (
  echo [ERROR] The pyserial package is missing.
  echo Run: python -m pip install -r requirements.txt
  goto :failed
)

python -c "import pythoncom, win32com.client" >nul 2>&1
if errorlevel 1 (
  echo [ERROR] The pywin32 package for voice feedback is missing.
  echo Run: python -m pip install -r requirements.txt
  goto :failed
)

python -u voice_controller.py --serial-port COM3 --web-port 8000
set "APP_EXIT=%ERRORLEVEL%"
echo.
echo Controller stopped with exit code %APP_EXIT%.
pause
exit /b %APP_EXIT%

:failed
echo.
echo Startup failed. Check the message above.
pause
exit /b 1
