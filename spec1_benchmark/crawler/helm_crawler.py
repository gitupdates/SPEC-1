import asyncio, httpx, time
from pathlib import Path

BENCHMARK = "helm"
BASE_URL = BASE_URL = "https://jsonplaceholder.typicode.com/todos/1"

RAW_DIR = Path("crawler/raw")

RAW_DIR.mkdir(parents=True, exist_ok=True)

async def fetch_helm():
    async with httpx.AsyncClient(timeout=30) as client:
        r = await client.get(BASE_URL)
        r.raise_for_status()
        ts = int(time.time())
        out = RAW_DIR / f"{BENCHMARK}_{ts}.json"
        out.write_bytes(r.content)
        print(f"[{BENCHMARK}] saved", out)

if __name__ == "__main__":
    asyncio.run(fetch_helm())
