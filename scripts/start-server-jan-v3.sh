#!/bin/bash -ex

PORT=51234
MODEL="RepublicOfKorokke/Jan-v3-4B-base-instruct-mlx-nvfp4"
MAX_TOKENS=131072

uv run vllm-mlx serve "$MODEL" \
    --max-tokens "$MAX_TOKENS" \
    --default-temperature 0.8 \
    --default-top-p 0.95 \
    --port "$PORT" \
    --continuous-batching \
    --use-paged-cache \
    --kv-cache-quantization \
    --kv-cache-quantization-bits 8
