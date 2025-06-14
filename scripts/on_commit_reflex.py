#!/usr/bin/env python3

import subprocess
import os
from datetime import datetime
from pathlib import Path

REPO_DIR = Path("/workspaces/SPEC-1")
LOG_FILE = REPO_DIR / ".jb0ts_commit_reflex.log"

def get_git_diff():
    result = subprocess.run(["git", "diff", "--name-only", "--cached"], capture_output=True, text=True)
    return result.stdout.strip().split("\n")

def run_tests():
    print("[JB0TS] Running test suite...")
    result = subprocess.run(["pytest", "--maxfail=1", "--disable-warnings"], capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print("[JB0TS] ❌ Tests failed. Aborting commit reflex.")
    else:
        print("[JB0TS] ✅ All tests passed.")

def log_commit_event(files):
    with open(LOG_FILE, "a") as log:
        log.write(f"\n[JB0TS] Commit Reflex Triggered at {datetime.now()}\n")
        for f in files:
            log.write(f" - {f}\n")

def main():
    os.chdir(REPO_DIR)
    files = get_git_diff()
    if files and files != ['']:
        log_commit_event(files)
        run_tests()
    else:
        print("[JB0TS] No staged files detected. Nothing to validate.")

if __name__ == "__main__":
    main()
