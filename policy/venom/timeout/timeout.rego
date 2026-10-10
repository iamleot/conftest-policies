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

import rego.v1

# METADATA
# description: |
#  Deny step without timeout.
# scope: rule
deny_no_timeout contains msg if {
	some testcase, step
	input.testcases[testcase].steps[step]
	not input.testcases[testcase].steps[step].timeout

	msg := $"Test case `${testcase}` of step `${step}` should have a `timeout`"
}

# METADATA
# description: |
#  Warn step with 0 timeout.
# scope: rule
warn_zero_timeout contains msg if {
	some testcase, step
	input.testcases[testcase].steps[step].timeout == 0

	msg := $"Test case `${testcase}` of step `${step}` has an infinite `timeout`"
}
