#!/bin/bash
# Patch JB0TS environment to auto-start Autopilot in every shell

START_LINE='bash /workspaces/SPEC-1/scripts/start_autopilot.sh &'
BASHRC="$HOME/.bashrc"

if ! grep -Fxq "$START_LINE" "$BASHRC"; then
  echo "" >> "$BASHRC"
  echo "# JB0TS Autopilot Launcher" >> "$BASHRC"
  echo "$START_LINE" >> "$BASHRC"
  echo "[JB0TS] Autopilot start hook added to .bashrc"
else
  echo "[JB0TS] Autopilot start hook already present in .bashrc"
fi
