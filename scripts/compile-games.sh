#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR}/.."

# Make sure the submodules are updated
git submodule update --init

# Stash eventual git changes
git stash

GOPONG_DIR="../Go_Pong"
# Compile Go_Pong
${GOPONG_DIR}/scripts/build-wasm.sh

# Copy to our folder
cp ${GOPONG_DIR}/build/go_pong.wasm ./public/games/gopong/go_pong.wasm
