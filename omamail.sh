#!/bin/bash
set -e

# Determine build mode: default to debug, --release for release
BUILD_MODE="debug"
if [[ "$1" == "--release" ]]; then
  BUILD_MODE="release"
fi

# Get the project root
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"

# Set up environment
export OMAMAIL_DEVELOPMENT_RESOURCES=1
export OMAMAIL_BIN="${PROJECT_ROOT}/target/standalone/${BUILD_MODE}/omamail"

# Run the app
exec "${PROJECT_ROOT}/app/build/omamail-app"
