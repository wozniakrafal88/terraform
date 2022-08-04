resource "aws_iam_role" "iam_role_rds" {
  name = "rwozniak2_iam_rds"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})

  tags = {
    Owner = var.tag_owner
    Name  = "rwozniak2_iam_rds"
  }
}

resource "aws_iam_role" "iam_role_s3" {
  name = "rwozniak2_iam_s3"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
  tags = {
    Owner = var.tag_owner
    Name  = "rwozniak2_iam_s3"
  }
}


resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = aws_iam_role.iam_role_s3.name
}

resource "aws_iam_instance_profile" "rds_profile" {
  name = "rds_profile"
  role = aws_iam_role.iam_role_rds.name
}


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

resource "aws_iam_policy" "rds_role_policy" {
  name   = "rwozniak2_rds_role_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.rds_role_policy_doc.json
}

resource "aws_iam_policy" "s3_role_policy" {
  name   = "rwozniak2_s3_role_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_role_policy_doc.json
}

resource "aws_iam_policy_attachment" "s3-attach" {
  name       = "s3-attachment"
  roles      = [aws_iam_role.iam_role_s3.name]
  policy_arn = aws_iam_policy.s3_role_policy.arn
}

resource "aws_iam_policy_attachment" "rds-attach" {
  name       = "rds-attachment"
  roles      = [aws_iam_role.iam_role_rds.name]
  policy_arn = aws_iam_policy.rds_role_policy.arn
}