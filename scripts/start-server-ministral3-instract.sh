#!/bin/bash -ex

PORT=51234
MODEL="mlx-community/Ministral-3-8B-Instruct-2512-4bit"
MAX_TOKENS=262144

uv run vllm-mlx serve "$MODEL" \
    --max-tokens "$MAX_TOKENS" \
    --default-temperature 0.8 \
    --default-top-p 0.95 \
    --port "$PORT" \
    --continuous-batching \
    --use-paged-cache \
    --kv-cache-quantization \
    --kv-cache-quantization-bits 8
