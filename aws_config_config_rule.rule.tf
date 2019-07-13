resource "aws_config_config_rule" "rule" {
  count = var.rules_count

  depends_on = [
    "aws_config_configuration_recorder.config",
  ]

  input_parameters = lookup(var.input_parameters, element(var.rules, count.index), "")
  name             = element(var.rules, count.index)

  source {
    owner             = "AWS"
    source_identifier = lookup(local.source_identifiers, element(var.rules, count.index))
  }
}
