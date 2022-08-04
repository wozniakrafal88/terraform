output "s3_iam_profile" {
  value = aws_iam_instance_profile.s3_profile.name
}

output "rds_iam_profile" {
  value = aws_iam_instance_profile.rds_profile.name
}