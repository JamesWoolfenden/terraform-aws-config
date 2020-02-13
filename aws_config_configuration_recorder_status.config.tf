resource "aws_config_configuration_recorder_status" "config" {
  depends_on = [
    aws_config_delivery_channel.config
  ]

  is_enabled = var.enable_recorder
  name       = aws_config_configuration_recorder.config.name
}
