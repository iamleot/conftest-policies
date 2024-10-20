package venom.timeout_test

import rego.v1

import data.venom.timeout

test_ok_no_timeout_in_empty_test if {
	cfg := parse_config("yaml", "")

	count(timeout.deny_no_timeout) == 0 with input as cfg
}

test_deny_no_timeout if {
	cfg := parse_config_file("testdata/no_timeout.yml")

	timeout.deny_no_timeout with input as cfg
}

test_warn_zero_timeout if {
	cfg := parse_config_file("testdata/zero_timeout.yml")

	count(timeout.deny_no_timeout) == 0 with input as cfg
	timeout.warn_zero_timeout with input as cfg
}
