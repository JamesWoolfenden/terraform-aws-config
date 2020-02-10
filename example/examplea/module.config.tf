module "config" {
  source      = "../../"
  name        = var.name
  log_bucket  = var.log_bucket
  common_tags = var.common_tags
}
