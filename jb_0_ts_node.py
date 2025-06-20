#!/usr/bin/env python3

import argparse
from pathlib import Path


def load_profile(profile_id):
    profile_path = Path(f"profiles/{profile_id}.yaml")
    if not profile_path.exists():
        raise FileNotFoundError(f"Profile '{profile_id}' not found.")
    print(f"[JB0TS] :: Loading twin profile from {profile_path}")
    return profile_path.read_text()


def initialize_agent(profile_id):
    try:
        profile_data = load_profile(profile_id)
        print(f"[JB0TS] :: Twin '{profile_id}' initialized successfully.")
        print(f"[JB0TS] :: Loaded configuration:\n{profile_data}")
        # This is where LLM backend, memory logic, hooks, etc. would load
        # Extend here with LangChain, Ollama, vector store hooks
    except Exception as e:
        print(f"[JB0TS] ERROR: Failed to initialize twin '{profile_id}': {e}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="JB0TS Unified Twin Loader")
    parser.add_argument("--profile", type=str, required=True, help="Twin profile ID")
    parser.add_argument("--live", action="store_true", help="Run in live mode")

    args = parser.parse_args()
    print(f"[JB0TS] :: Booting profile '{args.profile}' in {'live' if args.live else 'test'} mode")
    initialize_agent(args.profile)
