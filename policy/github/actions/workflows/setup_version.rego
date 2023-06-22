# METADATA
# title: Check that `*-version` in `setup-*` actions is a string
# description: |
#  The `*-version` parameters in GitHub Actions workflows `setup-*` should be
#  a string in order to properly work with versions.
#
#  By omitting string in YAML it can fallback to be parsed as a float and
#  accidentally truncate any possible trailing `0`.
#
#  For example, by using `go-version: 1.20` intended to require Go `1.20`
#  it will be actually parsed as `go-version: 1.2` and Go `1.2` will
#  be used instead!
# related_resources:
# - ref: https://github.com/actions/setup-go
#   description: GitHub - actions/setup-go
# - ref: https://github.com/actions/setup-java
#   description: GitHub - actions/setup-java
# - ref: https://github.com/actions/setup-node
#   description: GitHub - actions/setup-node
# - ref: https://github.com/actions/setup-python
#   description: GitHub - actions/setup-python
package github.actions.workflows.setup_version

import future.keywords.in

import data.github.actions.workflows.utils

deny_setup_go_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, step
	startswith(input.jobs[job].steps[step].uses, "actions/setup-go")
	not is_string(input.jobs[job].steps[step]["with"]["go-version"])

	msg := sprintf(
		"`go-version` in step `%v` of job `%v` that uses `actions/setup-go` should be a string",
		[step, job],
	)
}

deny_setup_java_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, step
	startswith(input.jobs[job].steps[step].uses, "actions/setup-java")
	not is_string(input.jobs[job].steps[step]["with"]["java-version"])

	msg := sprintf(
		"`java-version` in step `%v` of job `%v` that uses `actions/setup-java` should be a string",
		[step, job],
	)
}

deny_setup_node_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, step
	startswith(input.jobs[job].steps[step].uses, "actions/setup-node")
	not is_string(input.jobs[job].steps[step]["with"]["node-version"])

	msg := sprintf(
		"`node-version` in step `%v` of job `%v` that uses `actions/setup-node` should be a string",
		[step, job],
	)
}

deny_setup_python_version[msg] {
	f := concat("/", [data.conftest.file.dir, data.conftest.file.name])
	utils.is_github_workflows(f)
	some job, step
	startswith(input.jobs[job].steps[step].uses, "actions/setup-python")
	not is_string(input.jobs[job].steps[step]["with"]["python-version"])

	msg := sprintf(
		"`python-version` in step `%v` of job `%v` that uses `actions/setup-python` should be a string",
		[step, job],
	)
}
