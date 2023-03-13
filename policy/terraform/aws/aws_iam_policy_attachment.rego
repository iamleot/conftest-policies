# METADATA
# title: Prohibit use of `aws_iam_policy_attachment`
# description: |
#  `aws_iam_policy_attachment` creates an exclusive attachment of IAM
#  policies. If the IAM policy is attached to any other user(s), role(s) and/or
#  group(s) via another `aws_iam_policy_attachment` the original user(s),
#  role(s) and/or group(s) will get the attached IAM policy revoked.
#
#  `aws_iam_role_policy_attachment`, `aws_iam_user_policy_attachment` and
#  `aws_iam_group_policy_attachment` can be always used instead and do not have
#  any exclusive attachment.
# related_resources:
# - ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment
#   description: "`aws_iam_policy_attachment` `hashicorp/aws` provider resource documentation"
package terraform.aws.aws_iam_policy_attachment

import future.keywords.in

deny_aws_iam_policy_attachment[msg] {
	some resource
	input.resource.aws_iam_policy_attachment[resource]

	msg := sprintf(
		"`aws_iam_policy_attachment` `%v` creates exclusive attachment",
		[resource],
	)
}
