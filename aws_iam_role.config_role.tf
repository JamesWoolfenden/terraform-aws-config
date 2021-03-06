resource "aws_iam_role" "config_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  name               = local.config_name

  tags = var.common_tags
}
