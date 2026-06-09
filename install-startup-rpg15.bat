@echo off
setlocal

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET=%STARTUP%\start-rpg15.bat"
set "PROJECT_SCRIPT=%~dp0start-rpg15.bat"

(
  echo @echo off
  echo call "%PROJECT_SCRIPT%"
) > "%TARGET%"

if errorlevel 1 (
  echo [ERROR] Failed to create launcher in Startup folder.
  pause
  exit /b 1
)

echo Installed: %TARGET%
echo RPG15 will auto-start at logon.
pause

endlocal
