#!/bin/bash -ex

PORT=51235
MODEL="mlx-community/gpt-oss-20b-MXFP4-Q8"
MAX_TOKENS=131072
PARSER="gpt_oss"

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
