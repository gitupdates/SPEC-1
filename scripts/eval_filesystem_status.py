import os
import stat
from pathlib import Path

def evaluate_directory(path="."):
    base = Path(path)
    print(f"\n📁 Scanning Directory: {base.resolve()}\n")

    for file in base.rglob("*"):
        if file.is_file():
            status = []
            mode = file.stat().st_mode

            if os.access(file, os.R_OK):
                status.append("🟢 readable")
            else:
                status.append("🔒 unreadable")

            if mode & stat.S_IXUSR or file.suffix in [".sh", ".py", ".exe"]:
                status.append("⚙️ executable")

            if file.name.startswith(".") or ".git" in str(file):
                status.append("🔕 hidden/skipped")

            print(f"{file} :: {', '.join(status)}")

if __name__ == "__main__":
    evaluate_directory(".")
