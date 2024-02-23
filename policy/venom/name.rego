# METADATA
# title: Check `name` keys for test suite, test cases and steps
# description: |
#  Venom permit to have `name` keys for test suite, test cases and steps.
#
#  The `name` field serves as a short description and is used in several ways
#  in the report of Venom. For test cases it is used as an identifier to
#  permit referencing test variables.
#
#  Enforcing that is always present make the Venom tests more readable.
# related_resources:
# - ref: https://github.com/ovh/venom#concepts
#   description: 'Venom | Concepts'
# entrypoint: true
package venom.name

import rego.v1

deny_no_name contains msg if {
	# Check explicitly for input.testcases to avoid triggering for user
	# defined executors
	input.testcases
	not input.name

	msg := "Test suite should have a `name` key"
}

deny_no_name_in_testcase contains msg if {
	some testcase, _ in input.testcases
	not input.testcases[testcase].name

	msg := sprintf("Test case `%v` should have a `name` key", [testcase])
}

deny_no_name_in_step contains msg if {
	some testcase, _ in input.testcases
	some step, _ in input.testcases[testcase].steps
	not input.testcases[testcase].steps[step].name

	msg := sprintf(
		"Step `%v` of test case `%v` should have a `name` key",
		[step, testcase],
	)
}
