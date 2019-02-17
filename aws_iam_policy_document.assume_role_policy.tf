data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      identifiers = [
        "config.amazonaws.com",
      ]

      type = "Service"
    }
  }
}
