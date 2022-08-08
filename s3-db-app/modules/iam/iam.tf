resource "aws_iam_role" "iam_role_rds" {
  name = "${var.env_name}_${var.tag_name_prefix}_iam_rds"

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
    Name  = "${var.env_name}_${var.tag_name_prefix}_iam_rds"
  }
}

resource "aws_iam_role" "iam_role_s3" {
  name = "${var.env_name}_${var.tag_name_prefix}_iam_s3"

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
    Name  = "${var.env_name}_${var.tag_name_prefix}_iam_s3"
  }
}


resource "aws_iam_instance_profile" "s3_profile" {
  name = "${var.env_name}_${var.tag_name_prefix}_s3_profile"
  role = aws_iam_role.iam_role_s3.name
}

resource "aws_iam_instance_profile" "rds_profile" {
  name = "${var.env_name}_${var.tag_name_prefix}_rds_profile"
  role = aws_iam_role.iam_role_rds.name
}

resource "aws_iam_policy" "rds_role_policy" {
  name   = "${var.env_name}_${var.tag_name_prefix}_rds_role_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.rds_role_policy_doc.json
}

resource "aws_iam_policy" "s3_role_policy" {
  name   = "${var.env_name}_${var.tag_name_prefix}_s3_role_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_role_policy_doc.json
}

resource "aws_iam_policy_attachment" "s3-attach" {
  name       = "s3_attachment"
  roles      = [aws_iam_role.iam_role_s3.name]
  policy_arn = aws_iam_policy.s3_role_policy.arn
}

resource "aws_iam_policy_attachment" "rds-attach" {
  name       = "rds_attachment"
  roles      = [aws_iam_role.iam_role_rds.name]
  policy_arn = aws_iam_policy.rds_role_policy.arn
}