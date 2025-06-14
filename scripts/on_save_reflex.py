# on_save_reflex.py
# JB0TS Reflex Hook — Activates on file save events and triggers logic analysis

import os
import time
from pathlib import Path
import subprocess

WATCH_DIRS = ["engine", "scripts", "intelligence_hooks", "profiles"]
LOG_FILE = ".reflex_journal"


def log(msg):
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {msg}\n")


def scan_changes():
    changed = []
    for root in WATCH_DIRS:
        for path in Path(root).rglob("*.*"):
            if path.is_file():
                if time.time() - path.stat().st_mtime < 3:
                    changed.append(str(path))
    return changed


def act_on_changes(changed):
    for file in changed:
        if file.endswith(".py"):
            subprocess.call(["python3", "-m", "py_compile", file])
            log(f"🧠 Validated Python file: {file}")
        elif file.endswith(".sh"):
            os.chmod(file, 0o755)
            log(f"⚙️ Made shell script executable: {file}")
        elif file.endswith(".yaml"):
            log(f"📄 Profile file touched: {file}")


if __name__ == "__main__":
    while True:
        changed_files = scan_changes()
        if changed_files:
            act_on_changes(changed_files)
        time.sleep(2)
