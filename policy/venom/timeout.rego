# METADATA
# title: Enforce `timeout` key for tests
# description: |
#  Test steps can hangs indefinitely if they do not define a `timeout`.
#
#  Always define a `timeout` in all tests to avoid that.
# related_resources:
# - ref: https://cwe.mitre.org/data/definitions/400.html
#   description: 'CWE-400: Uncontrolled Resource Consumption'
package venom.timeout

deny_no_timeout[msg] {
	input.testcases[testcase].steps[step]
	not input.testcases[testcase].steps[step].timeout

	msg := sprintf(
		"Test case `%v` of step `%v` should have a `timeout`",
		[testcase, step],
	)
}
