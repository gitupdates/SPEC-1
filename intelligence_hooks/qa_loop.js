const { exec } = require("child_process");

console.log("[J0NB0T QA] :: Live commit analysis starting...");

exec("python3 ./spec1_benchmark/validate_cognition.py", (err, stdout, stderr) => {
  if (err) {
    console.error("[J0NB0T QA] :: Error in loop:", stderr);
    return;
  }
  console.log("[J0NB0T QA] :: Output >>", stdout);
});
