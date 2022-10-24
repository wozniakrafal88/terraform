resource "aws_ecr_repository" "s3_app" {
  name = "s3_app_${var.tag_owner}"
  force_delete = true
  
  tags = {
    Owner = var.tag_owner
    Name  = "${var.env_name}_${var.tag_name_prefix}_iam_rds_for_ec2"
  }
}

resource "aws_ecr_repository" "db_app" {
  name = "db_app_${var.tag_owner}"
  force_delete = true

  tags = {
    Owner = var.tag_owner
    Name  = "${var.env_name}_${var.tag_name_prefix}_iam_rds_for_ec2"
  }
}

resource "aws_ecr_lifecycle_policy" "s3_app_registry_policy" {
  repository = aws_ecr_repository.s3_app.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire untagged images",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_lifecycle_policy" "db_app_registry_policy" {
  repository = aws_ecr_repository.db_app.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire untagged images",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}