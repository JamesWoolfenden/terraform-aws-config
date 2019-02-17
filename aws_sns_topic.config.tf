resource "aws_sns_topic" "config" {
  name = "${local.config_name}"
}
