@echo off
setlocal

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

if exist "%STARTUP%\start-monitor.vbs" (
  del /f /q "%STARTUP%\start-monitor.vbs"
  echo Removed: %STARTUP%\start-monitor.vbs
) else (
  echo Not found: start-monitor.vbs ^(already uninstalled^)
)

if exist "%STARTUP%\start.bat" (
  del /f /q "%STARTUP%\start.bat"
  echo Removed: %STARTUP%\start.bat
)

echo Monitor auto-start has been removed.
pause

endlocal
