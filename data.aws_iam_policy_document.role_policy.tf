data "aws_iam_policy_document" "role_policy" {
  # checkov:skip=CKV_AWS_356: IAM policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  statement {
    actions = [
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.config.arn,
      "${aws_s3_bucket.config.arn}/*",
    ]
  }
}
