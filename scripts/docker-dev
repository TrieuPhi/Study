#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-study-quartz}"
PORT="${2:-8080}"
WS_PORT="${3:-3001}"

docker build -t "$IMAGE_NAME" .

exec docker run --rm -it \
  -p "$PORT":8080 \
  -p "$WS_PORT":3001 \
  -v "$PWD/content:/usr/src/app/content" \
  "$IMAGE_NAME"
