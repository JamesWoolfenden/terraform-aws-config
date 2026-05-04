resource "aws_kms_key" "s3" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = var.common_tags
}
