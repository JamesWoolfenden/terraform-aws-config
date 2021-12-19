resource "aws_sns_topic" "config" {
  name              = local.config_name
  kms_master_key_id = aws_kms_key.s3.arn
  tags              = var.common_tags
}
