# SPEC-1

Production-ready LLM benchmarking & evaluation pipeline (SPEC-1): microservices, ETL, Rust, Python, Prometheus, FastAPI.

## Structure

- infra/      – Terraform for AWS VPC, compute, buckets
- crawler/    – Python async crawlers for benchmarks (e.g., HELM, MLPerf)
- etl/        – PySpark ETL scripts for normalization
- engine/     – Rust composite scoring engine
- api/        – FastAPI backend & dashboard
- tests/      – Unit/integration tests
- archives/   – Snapshots, code, result exports

