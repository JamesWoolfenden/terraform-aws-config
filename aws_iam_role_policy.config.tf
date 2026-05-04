resource "aws_iam_role_policy" "config" {
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  name   = local.config-role-name
  policy = data.aws_iam_policy_document.role_policy.json
  role   = aws_iam_role.config_role.id
}
