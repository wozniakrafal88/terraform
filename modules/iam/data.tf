data "aws_iam_policy_document" "s3_role_policy_doc" {
  statement {
    effect= "Allow"
    actions= [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
    ]
    resources= [
        "arn:aws:logs:*:*:*"
    ]
  }
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
  statement {

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:GetAuthorizationToken"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "rds_role_policy_doc" {
  statement {
    effect= "Allow"
    actions= [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
    ]
    resources= [
        "arn:aws:logs:*:*:*"
    ]
  }
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
  statement {

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:GetAuthorizationToken"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "s3_jenkins_role_policy_doc" {
  statement {
    effect= "Allow"
    actions= [
        "*"
    ]
    resources= [
        "*"
    ]
  }
}
