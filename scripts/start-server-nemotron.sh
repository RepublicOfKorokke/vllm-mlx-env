#!/bin/bash -ex

PORT=51235
MODEL="mlx-community/NVIDIA-Nemotron-3-Nano-30B-A3B-NVFP4"
MAX_TOKENS=262144
PARSER="qwen3"

uv run vllm-mlx serve "$MODEL" \
    --max-tokens "$MAX_TOKENS" \
    --reasoning-parser "$PARSER" \
    --default-temperature 0.8 \
    --default-top-p 0.95 \
    --port "$PORT" \
    --continuous-batching \
    --kv-cache-quantization \
    --kv-cache-quantization-bits 8
