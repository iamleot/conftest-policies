package venom.timeout

test_ok_no_timeout_in_empty_test {
	cfg := parse_config("yaml", "")

	count(deny_no_timeout) == 0 with input as cfg
}

test_deny_no_timeout {
	cfg := parse_config_file("no_timeout.yml")

	deny_no_timeout with input as cfg
}

test_ok_all_timeout {
	cfg := parse_config_file("ok_timeout.yml")

	deny_no_timeout with input as cfg
}
