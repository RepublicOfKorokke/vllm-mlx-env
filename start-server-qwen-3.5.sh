#!/bin/bash -ex

PORT=51235
MODEL="RepublicOfKorokke/Qwen3.5-35B-A3B-mlx-lm-nvfp4"
MAX_TOKENS=262144
PARSER="qwen3"

uv run vllm-mlx serve "$MODEL" \
    --max-tokens "$MAX_TOKENS" \
    --reasoning-parser "$PARSER" \
    --default-temperature 0.8 \
    --default-top-p 0.95 \
    --port "$PORT" \
    --continuous-batching \
    --use-paged-cache \
    --kv-cache-quantization \
    --kv-cache-quantization-bits 8
