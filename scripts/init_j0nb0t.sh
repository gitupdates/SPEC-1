#!/bin/bash
echo "[J0NB0T] :: Initializing Sovereign Cognitive Node..."

# Launch lightweight in-memory RPC socket for local integration
nohup python3 ./engine/boot/j0nb0t_node.py --live &

# Activate memory monitors if present
if [ -f ./memory_qa/snapshot.core ]; then
  echo "[J0NB0T] :: Mounting memory QA cores"
  python3 ./memory_qa/mount_snapshot.py ./memory_qa/snapshot.core
fi

echo "[J0NB0T] :: Live bridge established."
