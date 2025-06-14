#!/bin/bash
echo "[EXPORT] Backing up VS Code configuration from this machine..."

mkdir -p config

code --list-keybindings > config/vscode_keybindings_$(hostname).json
code --list-extensions > config/vscode_extensions_$(hostname).txt

echo "[EXPORT] Config exported as vscode_*_$(hostname).*"
