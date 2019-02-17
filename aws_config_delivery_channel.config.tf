resource "aws_config_delivery_channel" "config" {
  depends_on = [
    "aws_config_configuration_recorder.config",
  ]

  name           = "${var.name}"
  s3_bucket_name = "${aws_s3_bucket.config.id}"

  snapshot_delivery_properties {
    delivery_frequency = "${var.delivery_frequency}"
  }

  sns_topic_arn = "${aws_sns_topic.config.arn}"
}
