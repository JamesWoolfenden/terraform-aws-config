resource "aws_s3_bucket" "config" {
  acl    = "log-delivery-write"
  bucket = local.config_name

  lifecycle {
    prevent_destroy = true
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    transition {
      days          = var.transition_to_glacier
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration
    }
  }

  logging {
    target_bucket = var.log_bucket
    target_prefix = "s3/${local.config_name}/"
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_policy" "config" {
  bucket = aws_s3_bucket.config.id
  policy = data.aws_iam_policy_document.config.json
}
