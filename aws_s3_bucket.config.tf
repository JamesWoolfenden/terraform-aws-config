resource "aws_s3_bucket" "config" {
  # checkov:skip=CKV_AWS_144: doesn't need to replicated across regions
  acl    = "log-delivery-write"
  bucket = local.config_name

  versioning {
    enabled    = true
    mfa_delete = true
  }

  lifecycle {
    prevent_destroy = false
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


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }


  tags = var.common_tags
}

resource "aws_s3_bucket_policy" "config" {
  bucket = aws_s3_bucket.config.id
  policy = data.aws_iam_policy_document.config.json
}
