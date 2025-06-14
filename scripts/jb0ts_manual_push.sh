#!/bin/bash
# Manual JB0TS Git Sync
cd /workspaces/SPEC-1 || exit 1
git add -A
git commit -m "[JB0TS Manual Sync] $(date '+%Y-%m-%d %H:%M:%S')"
git pull origin main --rebase
git push origin main
