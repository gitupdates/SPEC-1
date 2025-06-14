#!/usr/bin/env python3
import time, os, subprocess

HISTORY_FILE = os.path.expanduser("~/.bash_history")
TRIGGER = "#JB0TS:"

def tail(f):
    f.seek(0, os.SEEK_END)
    while True:
        line = f.readline()
        if not line:
            time.sleep(0.3)
            continue
        yield line

def execute_trigger(cmd):
    if "scan" in cmd:
        print("[JB0TS] :: Evaluating filesystem...")
        subprocess.call(["python3", "scripts/eval_filesystem_status.py"])
    elif "fix" in cmd:
        print("[JB0TS] :: Committing all fixes...")
        subprocess.call(["bash", "scripts/commit_all_.sh"])
    elif "plan" in cmd:
        print("[JB0TS] :: Generating next execution blueprint...")
        subprocess.call(["python3", "scripts/generate_jb0ts_plan.py"])

def monitor_terminal():
    with open(HISTORY_FILE, "r") as f:
        for line in tail(f):
            if TRIGGER in line:
                execute_trigger(line.strip())

if __name__ == "__main__":
    monitor_terminal()
