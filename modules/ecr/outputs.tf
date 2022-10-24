output "ecr_repo_s3_url" {
    value = aws_ecr_repository.s3_app.repository_url
}

output "ecr_repo_db_url" {
    value = aws_ecr_repository.db_app.repository_url
}