# METADATA
# title: Enforce `timeout` key for tests
# description: |
#  Test steps can hangs indefinitely if they do not define a `timeout`.
#
#  Always define a `timeout` in all tests to avoid that.
#
#  If for some reason this needs to be bypassed, explicitly set `timeout`
#  to 0.
# related_resources:
# - ref: https://cwe.mitre.org/data/definitions/400.html
#   description: 'CWE-400: Uncontrolled Resource Consumption'
# entrypoint: true
package venom.timeout

import future.keywords.in

deny_no_timeout[msg] {
	some testcase, step
	input.testcases[testcase].steps[step]
	not input.testcases[testcase].steps[step].timeout

	msg := sprintf(
		"Test case `%v` of step `%v` should have a `timeout`",
		[testcase, step],
	)
}

warn_zero_timeout[msg] {
	some testcase, step
	input.testcases[testcase].steps[step].timeout == 0

	msg := sprintf(
		"Test case `%v` of step `%v` has an infinite `timeout`",
		[testcase, step],
	)
}
