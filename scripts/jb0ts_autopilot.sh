#!/bin/bash

# JB0TS Autopilot Daemon
# Monitors file changes and auto-commits to GitHub

REPO_DIR="/workspaces/SPEC-1"
LOG_FILE="$REPO_DIR/.jb0ts_autopilot.log"
INTERVAL=30  # seconds between checks
GIT_BRANCH="main"

cd "$REPO_DIR" || exit 1

echo "[JB0TS] Autopilot started at $(date)" >> "$LOG_FILE"

while true; do
    git add -A
    if ! git diff --cached --quiet; then
        MSG="[JB0TS] Auto-commit on $(date '+%Y-%m-%d %H:%M:%S')"
        git commit -m "$MSG" >> "$LOG_FILE" 2>&1
        git pull origin "$GIT_BRANCH" --rebase >> "$LOG_FILE" 2>&1
        git push origin "$GIT_BRANCH" >> "$LOG_FILE" 2>&1
        echo "$MSG :: Changes committed and pushed." >> "$LOG_FILE"
    else
        echo "[JB0TS] No changes to commit at $(date)" >> "$LOG_FILE"
    fi
    sleep "$INTERVAL"
done
