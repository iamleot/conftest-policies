package github.dependabot.mandatory_toplevel_keys

dir := "/some/path/.github"

name := "dependabot.yml"

notdir := "/some/path/that/is/not/github"

notname := "not-dependabot.yml"

test_deny_no_updates_in_empty_dependabot {
	cfg := parse_config("yaml", "")

	deny_no_updates with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(deny_no_updates) == 0 with input as cfg
		with data.conftest.file.dir as notdir
		with data.conftest.file.name as notname
}

test_deny_no_version_in_empty_dependabot {
	cfg := parse_config("yaml", "")

	deny_no_version with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(deny_no_version) == 0 with input as cfg
		with data.conftest.file.dir as notdir
		with data.conftest.file.name as notname
}

test_ok_dependabot {
	cfg := parse_config_file("dependabot.yml")

	count(deny_no_updates) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(deny_no_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(deny_incorrect_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}
