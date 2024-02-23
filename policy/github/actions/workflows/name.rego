# METADATA
# title: Check `name` keys for workflow, job and steps
# description: |
#  GitHub Actions workflows permit to have `name` keys for workflows, jobs and
#  steps.
#
#  The `name` field serves as a short description of workflow/job/step and it
#  is used in several ways in the UI of GitHub Actions.
#
#  Enforcing that is always present make the GitHub Actions workflow more
#  readable and avoid machine-generated `name` that can be hard to follow.
# related_resources:
# - ref: https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions
#   description: Workflow syntax for GitHub Actions
# entrypoint: true
package github.actions.workflows.name

import rego.v1

import data.github.actions.workflows.utils

deny_no_name_in_workflow contains msg if {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	not input.name

	msg := "Workflow should have a `name` key"
}

deny_no_name_in_job contains msg if {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, _ in input.jobs
	not input.jobs[job].name

	msg := sprintf("Job `%v` should have a `name` key", [job])
}

deny_no_name_in_step contains msg if {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, _ in input.jobs
	some step, _ in input.jobs[job].steps
	not input.jobs[job].steps[step].name

	msg := sprintf(
		"Step `%v` of job `%v` should have a `name` key",
		[step, job],
	)
}
