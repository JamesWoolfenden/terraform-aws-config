module "config" {
  source      = "../../"
  name        = "aws-config"
  log_bucket  = "config-logs"
  common_tags = var.common_tags
}
