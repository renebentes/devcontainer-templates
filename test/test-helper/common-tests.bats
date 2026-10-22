#!/usr/bin/env bats

setup() {
    load 'common-setup'
    _common_setup

    USERNAME=${1:-vscode}
}

@test "{USERNAME} user should be created" {
    run id ${USERNAME}
    assert_success
}
