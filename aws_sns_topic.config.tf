resource "aws_sns_topic" "config" {
  name              = local.config_name
  kms_master_key_id = "alias/aws/sns"
  tags              = var.common_tags
}
