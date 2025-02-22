#!/usr/bin/env bash

set -eu
set -o pipefail

set +u

if [ -z "$1" ]; then
    DRYRUN_MODE='extract'
else
    DRYRUN_MODE=$1
fi

set -u

RENOVATE_BIN="npx --yes --package renovate -- renovate"
script -q -e -c "LOG_LEVEL='DEBUG' \
    RENOVATE_CONFIG_FILE='.gitlab/renovate.json' \
    $RENOVATE_BIN \
    --platform github \
    --dry-run=$DRYRUN_MODE \
    --schedule="" \
    " /dev/null 2>&1 | tee output.log

if echo "$(<output.log)" | grep -q "Configuration Error"; then
    echo "Configuration Error detected" 1>&2
    exit 1
elif echo "$(<output.log)" | grep -q "Temporary error"; then
    echo "Temporary error detected" 1>&2
    exit 1
else
    echo "No Error detected"
fi
set -x
