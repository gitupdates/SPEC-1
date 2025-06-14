#!/bin/bash
echo -e '\npython3 scripts/jb0ts_terminal_daemon.py &
alias jb0ts='\''python3 scripts/eval_filesystem_status.py && echo "[JB0TS] :: Analysis complete."'\''
' >> ~/.bashrc
