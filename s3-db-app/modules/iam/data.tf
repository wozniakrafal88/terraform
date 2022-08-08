data "aws_iam_policy_document" "s3_role_policy_doc" {
  statement {
    sid = "s3policy1"
    effect = "Allow"
    actions = [
      "s3:*",
    ]

    resources = [
     "arn:aws:s3:::rwozniak-s3/*",
    ]
  }
  statement {
    sid = "s3policy2"
    effect = "Allow"
    actions = [
      "s3:*",
    ]

    resources = [
     "arn:aws:s3:::rwozniak-s3",
    ]
  }
}

data "aws_iam_policy_document" "rds_role_policy_doc" {
  statement {
    sid = "rdspolicy"
    effect = "Allow"
    actions = [
      "rds-db:connect",
    ]

    resources = [
     "arn:aws:rds-db:eu-west-1:890769921003:dbuser:${var.resource_id}/*",
    ]
  }
}