module "config" {
  source      = "../../"
  name        = var.name
  log_bucket  = aws_s3_bucket.logging.bucket
  common_tags = var.common_tags
}
