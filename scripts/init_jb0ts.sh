#!/bin/bash

echo "[JB0TS] Initializing Unified Twin Network..."

# Launch both twin profiles using unified node loader
python3 engine/boot/jb0ts_node.py --profile j0nb0t --live &
python3 engine/boot/jb0ts_node.py --profile 'j$0nb0t' --live &



echo "[JB0TS] Live bridge established."
