#!/bin/bash
echo "[RESET] Restoring default VS Code keybindings..."

if [ -f config/vscode_keybindings.json ]; then
  cp config/vscode_keybindings.json ~/.config/Code/User/keybindings.json
  echo "[RESET] Keybindings restored and synced to VS Code."
else
  echo "[ERROR] Default keybindings file not found in config/"
fi
