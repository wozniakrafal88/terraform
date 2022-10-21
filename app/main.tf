module "db_app" {
  source = "../modules/app"

  sd_namespace_id    = data.terraform_remote_state.infra_state.outputs.sd_namespace_id
  app_name           = "db"
  app_port           = "5000"
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  iam_profile        = data.terraform_remote_state.infra_state.outputs.rds_iam_profile
  iam_role_arn       = data.terraform_remote_state.infra_state.outputs.rds_iam_role_arn
  ecr_repo_url       = data.terraform_remote_state.infra_state.outputs.ecr_repo_db_url
  image_tag          = var.db_app_image_tag
} 

module "s3_app" {
  source = "../modules/app"

  sd_namespace_id    = data.terraform_remote_state.infra_state.outputs.sd_namespace_id
  app_name           = "s3"
  app_port           = "5000"
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  iam_profile        = data.terraform_remote_state.infra_state.outputs.s3_iam_profile
  iam_role_arn       = data.terraform_remote_state.infra_state.outputs.s3_iam_role_arn
  ecr_repo_url       = data.terraform_remote_state.infra_state.outputs.ecr_repo_s3_url
  image_tag          = var.s3_app_image_tag
} 

module "ec2" {
  source = "../modules/ec2"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  s3_iam_profile     = data.terraform_remote_state.infra_state.outputs.s3_iam_profile
  rds_iam_profile    = data.terraform_remote_state.infra_state.outputs.rds_iam_profile
  rds_to_ec2_iam_profile = data.terraform_remote_state.infra_state.outputs.rds_to_ec2_iam_profile
  s3_jenkins_to_ec2_profile = data.terraform_remote_state.infra_state.outputs.s3_jenkins_to_ec2_profile
  rds_host           = data.terraform_remote_state.infra_state.outputs.rds_host
  db_port            = data.terraform_remote_state.infra_state.outputs.db_port
  db_username        = data.terraform_remote_state.infra_state.outputs.db_username
  sc_lb_id           = data.terraform_remote_state.infra_state.outputs.sc_lb_id
  vpc_id             = data.terraform_remote_state.infra_state.outputs.vpc_id
  public_subnet_ids  = data.terraform_remote_state.infra_state.outputs.public_subnet_ids
  private_subnet_ids = data.terraform_remote_state.infra_state.outputs.private_subnet_ids
  sc_ssh_id          = data.terraform_remote_state.infra_state.outputs.sc_ssh_id
  sc_apps_id         = data.terraform_remote_state.infra_state.outputs.sc_apps_id
  sc_jenkins_id      = data.terraform_remote_state.infra_state.outputs.sc_jenkins_id
  jenkins_load_Balancer_url= module.ecs.jenkins_load_Balancer_url
}

module "ecs" {
  source = "../modules/ecs"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  vpc_id             = data.terraform_remote_state.infra_state.outputs.vpc_id
  sc_lb_id           = data.terraform_remote_state.infra_state.outputs.sc_lb_id
  public_subnet_ids  = data.terraform_remote_state.infra_state.outputs.public_subnet_ids
  sc_apps_id         = data.terraform_remote_state.infra_state.outputs.sc_apps_id
  private_subnet_ids = data.terraform_remote_state.infra_state.outputs.private_subnet_ids
  ec2_jenkins_id     = module.ec2.ec2_jenkins_id
  app_info           = [
    module.db_app,
    module.s3_app
  ]
}
