package github.actions.workflows.name_test

import rego.v1

import data.github.actions.workflows.name

dir := "/some/path/.github/workflows"

name := "test.yml"

notdir := "/some/path/that/is/not/github/workflows"

notname := "test.sh"

test_deny_no_name_in_empty_workflow if {
	cfg := parse_config("yaml", "")

	name.deny_no_name_in_workflow with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(name.deny_no_name_in_workflow) == 0 with input as cfg
		with data.conftest.file.dir as notdir
		with data.conftest.file.name as notname
}

test_deny_no_name_in_job if {
	cfg := parse_config_file("testdata/workflow_with_undocumented_job.yml")

	name.deny_no_name_in_job with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(name.deny_no_name_in_job) == 0 with input as cfg
		with data.conftest.file.dir as notdir
		with data.conftest.file.name as notname
}

test_deny_no_name_in_step if {
	cfg := parse_config_file("testdata/workflow_with_undocumented_step.yml")

	name.deny_no_name_in_step with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(name.deny_no_name_in_step) == 0 with input as cfg
		with data.conftest.file.dir as notdir
		with data.conftest.file.name as notname
}

test_ok_documented_workflow if {
	cfg := parse_config_file("testdata/documented_workflow.yml")

	count(name.deny_no_name_in_workflow) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(name.deny_no_name_in_job) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
	count(name.deny_no_name_in_step) == 0 with input as cfg
		with data.conftest.file.dir as dir
		with data.conftest.file.name as name
}
