locals{
s3_env_vars = ["BUCKET_NAME=${var.bucket_name}", "DB_API_URL=http://${aws_lb.load_balancer.dns_name}/db/API_number_of_books/"]
db_env_vars =  ["RDSHOST=${var.rds_host}", "DB_DBNAME=${var.db_name}", "DB_PORT=${var.db_port}", "DB_USERNAME=${var.db_username}", "AWS_REGION=eu-west-1"]

db_user_data = {yum_programs = var.db_yum_programs, pip_programs = var.db_pip_programs, git_url = var.db_git_url, env_variables = local.db_env_vars, app_name = var.db_app_name}
s3_user_data = {yum_programs = var.s3_yum_programs, pip_programs = var.s3_pip_programs, git_url = var.s3_git_url, env_variables = local.s3_env_vars, app_name = var.s3_app_name}
}