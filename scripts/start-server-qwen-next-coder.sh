#!/bin/bash -ex

PORT=51235

MODELS=(
    "RepublicOfKorokke/Qwen3-Coder-Next-mlx-nvfp4"
    "RepublicOfKorokke/Qwen3-Coder-Next-REAP-48B-A3B-mlx-nvfp4"
)
MODEL=$(printf '%s\n' "${MODELS[@]}" | fzf --prompt="Select a model: " --no-multi --no-sort --exit-0)
if [ -z "$MODEL" ]; then
    echo "No model selected. Exiting."
    exit 1
fi

MAX_TOKENS=131072

uv run vllm-mlx serve "$MODEL" \
    --max-tokens "$MAX_TOKENS" \
    --default-temperature 0.8 \
    --default-top-p 0.95 \
    --port "$PORT" \
    --continuous-batching \
    --kv-cache-quantization \
    --kv-cache-quantization-bits 8
