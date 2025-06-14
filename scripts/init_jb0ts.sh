#!/bin/bash

echo "[JB0TS] Initializing Unified Twin Network..."

python3 engine/boot/jb0ts_node.py --profile j0nb0t --live &
sleep 1
python3 engine/boot/jb0ts_node.py --profile j$0nb0t --live &


echo "[JB0TS] Live bridge established."