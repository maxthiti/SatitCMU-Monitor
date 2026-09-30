set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR"
URL="http://localhost:8080/?sn=202604150030"

if [[ ! -f "$PROJECT_DIR/index.html" ]]; then
  exit 1
fi

if ! command -v http-server >/dev/null 2>&1; then
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Monitor Startup" "http-server not found. Run: npm install -g http-server"
  fi
  exit 1
fi

if ! command -v lsof >/dev/null 2>&1 || ! lsof -iTCP:8080 -sTCP:LISTEN >/dev/null 2>&1; then
  nohup http-server "$PROJECT_DIR" --proxy http://localhost -p 8080 \
    >"${TMPDIR:-/tmp}/monitor-http-server.log" 2>&1 &
fi

sleep 5

# if command -v firefox >/dev/null 2>&1; then
#   nohup firefox --new-window "$URL" >/dev/null 2>&1 &
#   fullscreen_with_f11
# elif command -v google-chrome >/dev/null 2>&1; then
#   nohup google-chrome --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
#   fullscreen_with_f11
# elif command -v google-chrome-stable >/dev/null 2>&1; then
#   nohup google-chrome-stable --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
#   fullscreen_with_f11
# elif command -v chromium-browser >/dev/null 2>&1; then
#   nohup chromium-browser --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
#   fullscreen_with_f11
# elif command -v chromium >/dev/null 2>&1; then
#   nohup chromium --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
#   fullscreen_with_f11
# else
#   xdg-open "$URL" >/dev/null 2>&1 || true
# fi

if command -v google-chrome >/dev/null 2>&1; then
  nohup google-chrome --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
elif command -v google-chrome-stable >/dev/null 2>&1; then
  nohup google-chrome-stable --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
elif command -v firefox >/dev/null 2>&1; then
  nohup firefox --kiosk "$URL" >/dev/null 2>&1 &
elif command -v chromium-browser >/dev/null 2>&1; then
  nohup chromium-browser --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
elif command -v chromium >/dev/null 2>&1; then
  nohup chromium --new-window --start-fullscreen "$URL" >/dev/null 2>&1 &
else
  xdg-open "$URL" >/dev/null 2>&1 || true
fi
