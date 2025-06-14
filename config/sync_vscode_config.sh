#!/bin/bash
echo "[SYNC] Exporting current VS Code keybindings and extensions..."

mkdir -p config

code --list-keybindings > config/vscode_keybindings.json
code --list-extensions > config/vscode_extensions.txt

echo "[SYNC] VS Code config exported to ./config/"
