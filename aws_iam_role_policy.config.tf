resource "aws_iam_role_policy" "config" {
  name   = local.config-role-name
  policy = data.aws_iam_policy_document.role_policy.json
  role   = aws_iam_role.config_role.id
}
