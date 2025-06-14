#!/bin/bash

echo "[GIT SYNC] Adding all recent changes..."
git add .

COMMIT_MSG="Auto-commit all updates on $(date '+%Y-%m-%d %H:%M:%S')"
echo "[GIT SYNC] Committing with message: \"$COMMIT_MSG\""
git commit -m "$COMMIT_MSG"

echo "[GIT SYNC] Pushing to origin..."
git push

echo "[GIT SYNC] Commit complete."
