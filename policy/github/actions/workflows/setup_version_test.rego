package github.actions.workflows.setup_version_test

import rego.v1

import data.github.actions.workflows.setup_version

dir := "/some/path/.github/workflows"

name := "test.yml"

test_deny_setup_go_version_float if {
	cfg := parse_config_file("testdata/setup_version_go_with_go_version_float.yml")

	setup_version.deny_setup_go_version with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_go_without_go_version if {
	cfg := parse_config_file("testdata/setup_version_go_without_go_version.yml")

	count(setup_version.deny_setup_go_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_go_with_string if {
	cfg := parse_config_file("testdata/setup_version_go_with_go_version_string.yml")

	count(setup_version.deny_setup_go_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_deny_setup_java_version_float if {
	cfg := parse_config_file("testdata/setup_version_java_with_java_version_float.yml")

	setup_version.deny_setup_java_version with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_java_without_java_version if {
	cfg := parse_config_file("testdata/setup_version_java_without_java_version.yml")

	count(setup_version.deny_setup_java_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_java_with_string if {
	cfg := parse_config_file("testdata/setup_version_java_with_java_version_string.yml")

	count(setup_version.deny_setup_java_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_deny_setup_node_version_float if {
	cfg := parse_config_file("testdata/setup_version_node_with_node_version_float.yml")

	setup_version.deny_setup_node_version with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_node_without_node_version if {
	cfg := parse_config_file("testdata/setup_version_node_without_node_version.yml")

	count(setup_version.deny_setup_node_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_node_with_string if {
	cfg := parse_config_file("testdata/setup_version_node_with_node_version_string.yml")

	count(setup_version.deny_setup_node_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_deny_setup_python_version_float if {
	cfg := parse_config_file("testdata/setup_version_python_with_python_version_float.yml")

	setup_version.deny_setup_python_version with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_python_without_python_version if {
	cfg := parse_config_file("testdata/setup_version_python_without_python_version.yml")

	count(setup_version.deny_setup_python_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}

test_ok_setup_python_with_string if {
	cfg := parse_config_file("testdata/setup_version_python_with_python_version_string.yml")

	count(setup_version.deny_setup_python_version) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}
