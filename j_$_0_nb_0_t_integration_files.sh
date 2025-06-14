mkdir -p .j0nb0t scripts intelligence_hooks .vscode

# 1. agent.config.json
cat <<EOF > .j$0nb0t/agent.config.json
{
  "agent_id": "J$0NB0T",
  "enabled": true,
  "trigger_keywords": ["J$0NB0T:", "J$0NB0T:"],
  "permissions": ["read", "write", "exec"],
  "integration_mode": "codespace-live",
  "monitor_dirs": ["engine", "memory_qa", "spec1_benchmark", "llama_cpp"],
  "hooks": {
    "on_notebook_run": "./scripts/init_j$0nb0t.sh",
    "on_commit": "./intelligence_hooks/qa_loop.js"
  }
}
EOF

# 2. init_j0nb0t.sh
cat <<'EOF' > scripts/init_j0nb0t.sh
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
EOF
chmod +x scripts/init_j0nb0t.sh

# 3. qa_loop.js
cat <<'EOF' > intelligence_hooks/qa_loop.js
const { exec } = require("child_process");

console.log("[J0NB0T QA] :: Live commit analysis starting...");

exec("python3 ./spec1_benchmark/validate_cognition.py", (err, stdout, stderr) => {
  if (err) {
    console.error("[J0NB0T QA] :: Error in loop:", stderr);
    return;
  }
  console.log("[J0NB0T QA] :: Output >>", stdout);
});
EOF

# 4. VS Code Task
cat <<EOF > .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Start J0NB0T Live Node",
      "type": "shell",
      "command": "bash scripts/init_j0nb0t.sh",
      "group": "build",
      "problemMatcher": [],
      "detail": "Boot the J0NB0T sovereign live bridge"
    }
  ]
}
EOF

# 5. VS Code Launch Config
cat <<EOF > .vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Run J0NB0T Bridge",
      "type": "python",
      "request": "launch",
      "program": "\${workspaceFolder}/engine/boot/j0nb0t_node.py",
      "args": ["--live"],
      "console": "integratedTerminal"
    }
  ]
}
EOF
