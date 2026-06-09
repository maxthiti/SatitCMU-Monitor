@echo off
setlocal

@REM เปลี่ยนเป็นที่อยู่ของโปรเจคต์
set "PROJECT_DIR=%~dp0"
if not exist "%PROJECT_DIR%index.html" (
  set "PROJECT_DIR=C:\Users\Computer01\Thitipong\RPG15-School\RPG15\"
)

cd /d "%PROJECT_DIR%"

where http-server >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Could not find http-server command.
  echo Install it once with: npm install -g http-server
  pause
  exit /b 1
)

start "RPG15 Server" cmd /k "cd /d ""%PROJECT_DIR%"" && http-server --proxy http://localhost -p 8080"
timeout /t 2 /nobreak >nul
start "" "http://localhost:8080/?sn=202604150001"
@REM เปลี่ยนทsnที่ต้องการ

endlocal
