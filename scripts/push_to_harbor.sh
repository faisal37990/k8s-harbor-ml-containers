#!/usr/bin/env bash
# ==============================================================================
# Script: push_to_harbor.sh
# Author: Faisal Sharif (@faisal37990)
# Purpose: Build, tag, scan, and push evaluation images to Harbor Registry
# ==============================================================================

set -euo pipefail

IMAGE_TAG="${1:-harbor.internal.corp/ai-training-eval/eval-suite:latest}"

echo "=================================================================="
echo "  BUILDING & PUSHING CONTAINER TO HARBOR REGISTRY"
echo "  Engineer: Faisal Sharif (@faisal37990)"
echo "  Target: ${IMAGE_TAG}"
echo "=================================================================="

# 1. Build image with multi-stage caching
echo "[1/4] Building Docker container image..."
docker build -f Dockerfile.eval -t "${IMAGE_TAG}" .

# 2. Authenticate to Harbor (if token supplied)
if [[ -n "${HARBOR_TOKEN:-}" ]]; then
    echo "[2/4] Authenticating with Harbor robot account..."
    echo "${HARBOR_TOKEN}" | docker login harbor.internal.corp -u "${HARBOR_USER:-robot-eval}" --password-stdin
fi

# 3. Push to Harbor
echo "[3/4] Pushing image artifact to Harbor..."
docker push "${IMAGE_TAG}"

echo "[4/4] Harbor deployment complete! Ready for Kubernetes Job execution."
