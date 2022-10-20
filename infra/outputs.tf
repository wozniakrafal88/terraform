output "test" {
  value = terraform.workspace
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sd_namespace_id" {
  value = module.cloud_map.sd_namespace_id
}

output "rds_iam_profile" {
  value = module.iam.rds_iam_profile
}

output "rds_iam_role_arn" {
  value = module.iam.rds_iam_role_arn
}

output "s3_iam_profile" {
  value = module.iam.s3_iam_profile
}

output "s3_iam_role_arn" {
  value = module.iam.s3_iam_role_arn
}

output "rds_to_ec2_iam_profile" {
  value = module.iam.rds_to_ec2_iam_profile
}

output "s3_jenkins_to_ec2_profile" {
  value = module.iam.s3_jenkins_to_ec2_profile
}

output "rds_host" {
  value = module.rds.rds_host
}

output "db_port" {
  value = module.rds.db_port
}

output "db_username" {
  value = module.rds.db_username
}

output "sc_lb_id" {
  value = module.vpc.sc_lb_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "sc_ssh_id" {
  value = module.vpc.sc_ssh_id
}

output "sc_apps_id" {
  value = module.vpc.sc_apps_id
}

output "sc_jenkins_id" {
  value = module.vpc.sc_jenkins_id
}

output "ecr_repo_s3_url" {
    value = module.ecr.ecr_repo_s3_url
}

output "ecr_repo_db_url" {
    value = module.ecr.ecr_repo_db_url
}