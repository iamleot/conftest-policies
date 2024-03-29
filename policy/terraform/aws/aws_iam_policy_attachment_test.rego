package terraform.aws.aws_iam_policy_attachment_test

import rego.v1

import data.terraform.aws.aws_iam_policy_attachment

test_deny_aws_iam_policy_attachment if {
	cfg := parse_config(
		"hcl2",
		`resource "aws_iam_policy_attachment" "this" {}`,
	)

	aws_iam_policy_attachment.deny_aws_iam_policy_attachment with input as cfg
}
