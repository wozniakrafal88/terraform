locals{
s3_env_vars = ["BUCKET_NAME=${var.bucket_name}", "DB_API_URL=http://${aws_lb.load_balancer.dns_name}/db/API_number_of_books/"]
db_env_vars =  ["RDSHOST=${var.rds_host}", "DB_DBNAME=${var.db_name}", "DB_PORT=${var.db_port}", "DB_USERNAME=${var.db_username}", "AWS_REGION=eu-west-1"]
}