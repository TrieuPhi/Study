#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-study-quartz}"

docker build -t "$IMAGE_NAME" .

echo "Built image: $IMAGE_NAME"
