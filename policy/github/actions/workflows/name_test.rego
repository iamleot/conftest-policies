package github.actions.workflows.name

test_deny_no_name_in_empty_workflow {
	cfg := parse_config("yaml", "")

	deny_no_name_in_workflow with input as cfg
}

test_deny_no_name_in_job {
	cfg := parse_config_file("workflow_with_undocumented_job.yml")

	deny_no_name_in_job with input as cfg
}

test_deny_no_name_in_step {
	cfg := parse_config_file("workflow_with_undocumented_step.yml")

	deny_no_name_in_step with input as cfg
}

test_ok_documented_workflow {
	cfg := parse_config_file("documented_workflow.yml")

	count(deny_no_name_in_workflow) == 0 with input as cfg
	count(deny_no_name_in_job) == 0 with input as cfg
	count(deny_no_name_in_step) == 0 with input as cfg
}
