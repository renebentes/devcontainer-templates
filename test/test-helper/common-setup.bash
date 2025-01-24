#!/usr/bin/env bash

_common_setup() {
    load 'test-helper/bats-support/load'
    load 'test-helper/bats-assert/load'

    PROJECT_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." >/dev/null 2>&1 && pwd)"
    PATH="$PROJECT_ROOT:$PATH"
}
