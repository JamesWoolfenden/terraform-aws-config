resource "aws_config_configuration_recorder" "config" {
  name = "${var.name}"

  recording_group {
    include_global_resource_types = true
  }

  role_arn = "${aws_iam_role.config_role.arn}"
}
