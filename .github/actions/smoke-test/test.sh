#!/bin/bash
TEMPLATE_ID="$1"
set -e

SRC_DIR="/tmp/${TEMPLATE_ID}"
echo "Running Smoke Test"

ID_LABEL="test-container=${TEMPLATE_ID}"
devcontainer exec --workspace-folder "${SRC_DIR}" --id-label "${ID_LABEL}" \
    /bin/sh -c "if [ -d \"test-project\" ]; then cd test-project && ./bats/bin/bats .; else ls -a; fi"

# Clean up
echo "Performing Clean up"
docker rm -f "$(docker container ls -f "label=${ID_LABEL}" -q)"
rm -rf "${SRC_DIR}"
