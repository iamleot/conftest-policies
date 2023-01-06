package venom.name

test_ok_no_name_in_empty_test {
	cfg := parse_config("yaml", "")

	count(deny_no_name) == 0 with input as cfg
	count(deny_no_name_in_testcase) == 0 with input as cfg
}

test_deny_no_name {
	cfg := parse_config_file("no_name.yml")

	deny_no_name with input as cfg
}

test_deny_no_name_in_testcase {
	cfg := parse_config_file("no_name_testcase.yml")

	deny_no_name_in_testcase with input as cfg
}
