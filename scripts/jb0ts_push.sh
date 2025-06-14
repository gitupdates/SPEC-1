#!/bin/bash
# jb0ts_push.sh — Auto-push script for JB0TS Git Sync

echo "[JB0TS] Checking Git repo status..."
cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)" || exit 1

if [ -z "$(git status --porcelain)" ]; then
    echo "[JB0TS] No changes to commit."
    exit 0
fi

echo "[JB0TS] Staging all changes..."
git add .

echo "[JB0TS] Committing changes..."
git commit -m "🔁 Auto-commit: JB0TS Sync"

echo "[JB0TS] Pushing to origin..."
git push origin "$(git rev-parse --abbrev-ref HEAD)"

echo "[JB0TS] ✅ Push complete."
