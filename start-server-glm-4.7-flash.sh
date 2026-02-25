#!/bin/bash -ex

PORT=51235
MODEL="n1k1tung/GLM-4.7-Flash-REAP-23B-A3B-6-bit"
MAX_TOKENS=131072
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
