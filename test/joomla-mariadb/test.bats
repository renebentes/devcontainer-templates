#!/usr/bin/env bats

setup() {
    load 'test-helper/common-setup'
    _common_setup
}

@test "php version should be ${PHP_VERSION}" {
    run php --version
    assert_output --partial "PHP ${PHP_VERSION}"
}

@test "apachectl command must be available" {
    run which apachectl
    assert_success
}

@test 'composer command must be available' {
    run which composer
    assert_success
}

@test "Xdebug should be integretad to PHP" {
    run php --version
    assert_output --partial "Xdebug"
}

@test 'Joomla version should be ${JOOMLA_VERSION}' {
    run /var/www/html/cli/joomla.php --version
    assert_output --partial "Joomla! ${JOOMLA_VERSION}"
}
