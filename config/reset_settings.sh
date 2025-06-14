#!/bin/bash
echo "[RESET] Restoring default VS Code user settings..."

if [ -f config/vscode_settings.json ]; then
  cp config/vscode_settings.json ~/.config/Code/User/settings.json
  echo "[RESET] Default settings.json restored."
else
  echo "[ERROR] Default settings.json not found in config/"
fi
