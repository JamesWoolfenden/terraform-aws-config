module "config" {
  source     = "../../"
  name       = "aws-config"
  log_bucket = "config-logs"
}
