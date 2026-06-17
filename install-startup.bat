@echo off
setlocal

@REM เปลี่ยนชื่อ
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET=%STARTUP%\start-monitor.vbs"
set "PROJECT_DIR=%~dp0"
set "PROJECT_VBS=%~dp0start-silent.vbs"
if "%PROJECT_DIR:~-1%"=="\" set "PROJECT_DIR=%PROJECT_DIR:~0,-1%"

if exist "%STARTUP%\start.bat" del /f /q "%STARTUP%\start.bat"

> "%TARGET%" echo Option Explicit
>> "%TARGET%" echo CreateObject^("WScript.Shell"^).Run Chr^(34^) ^& "%PROJECT_VBS%" ^& Chr^(34^), 0, False

if errorlevel 1 (
  echo [ERROR] Failed to install silent launcher in Startup folder.
  pause
  exit /b 1
)

echo Installed: %TARGET%
echo Project path: %PROJECT_DIR%
echo Monitor silent auto-start is enabled.
pause

endlocal
