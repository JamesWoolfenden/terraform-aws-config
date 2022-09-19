resource "aws_s3_bucket" "logging" {
  # checkov:skip=CKV_AWS_18: not required
  # checkov:skip=CKV_AWS_21: not required
  # checkov:skip=CKV_AWS_144: doesn't need to replicated across regions
  acl    = "log-delivery-write"
  bucket = "config-logging-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled    = false
    mfa_delete = false
  }

  lifecycle {
    prevent_destroy = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = module.config.kms_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = var.common_tags
}

data "aws_caller_identity" "current" {}
