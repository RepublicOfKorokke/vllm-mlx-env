# About

This repository provides ready-to-run shell scripts for launching MLX-based inference servers using `vllm-mlx`.

Each script is tailored for a specific model or model family, with optimized parameters for performance and memory efficiency.

The scripts support features like:

- Continuous batching for improved throughput
- KV cache quantization for reduced memory usage
- Configurable token limits and sampling parameters
- Reasoning parsers for structured output

# Dependencies

To run the scripts in this repository, you need the following tools:

- **uv** - Python package manager (for running `vllm-mlx`)
- **fzf** - Command-line fuzzy finder (for model selection in `start-server-qwen-next-coder.sh`)
- **viddy** - Terminal-based process monitor (for `watch-server-status.sh`)
- **curl** - For making HTTP requests to check server status
- **jq** - JSON processor (for parsing status responses)

## Installing Python Dependencies

The Python dependencies are managed via `uv.lock`. To install them:

```bash
uv sync
```

This will create a virtual environment and install all required packages defined in `uv.lock`.

# How to run scripts

## Running a specific server

All scripts are designed to be run directly with `uv run` to ensure the correct Python environment and dependencies are used.

## Running a specific server

```bash
# Example: Start the Qwen 3.5 server
./scripts/start-server-qwen-3.5.sh

# Example: Start the Qwen Next Coder server (interactive model selection)
./scripts/start-server-qwen-next-coder.sh
```

## Checking server status

```bash
# Use the watch script
./scripts/watch-server-status.sh 51235

# Or check manually
curl http://localhost:51235/v1/status | jq
```

## Notes

- Each script uses a specific port (check the `PORT` variable in each script)
- The `start-server-qwen-next-coder.sh` script uses `fzf` for interactive model selection
