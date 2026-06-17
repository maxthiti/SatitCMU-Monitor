#!/usr/bin/env bash
set -euo pipefail

AUTOSTART_FILE="$HOME/.config/autostart/monitor-autostart.desktop"
LAUNCHER_FILE="$HOME/.local/bin/monitor-autostart.sh"

if [[ -f "$AUTOSTART_FILE" ]]; then
  rm -f "$AUTOSTART_FILE"
  echo "Removed: $AUTOSTART_FILE"
else
  echo "Not found: $AUTOSTART_FILE"
fi

if [[ -f "$LAUNCHER_FILE" ]]; then
  rm -f "$LAUNCHER_FILE"
  echo "Removed: $LAUNCHER_FILE"
else
  echo "Not found: $LAUNCHER_FILE"
fi

echo "Monitor Linux autostart removed."
