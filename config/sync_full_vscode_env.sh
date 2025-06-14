#!/bin/bash
echo "[FULL SYNC] Backing up VS Code user environment..."

mkdir -p config

code --list-keybindings > config/vscode_keybindings.json
code --list-extensions > config/vscode_extensions.txt

SETTINGS_PATH="$HOME/.config/Code/User/settings.json"
if [ -f "$SETTINGS_PATH" ]; then
  cp "$SETTINGS_PATH" config/vscode_settings_backup.json
  echo "[FULL SYNC] User settings backed up."
else
  echo "[WARN] No user settings.json found to back up."
fi

echo "[FULL SYNC] Done. Review ./config for all exported data."
