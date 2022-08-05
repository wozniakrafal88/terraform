module "vpc" {
  source = "./modules/vpc"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
}

module "rds" {
  source = "./modules/rds"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  sc_db_id           = module.vpc.sc_db_id
}

module "iam" {
  source = "./modules/iam"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  resource_id = module.rds.resource_id
  arn         = module.rds.arn
}

module "ec2" {
  source = "./modules/ec2"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  s3_iam_profile     = module.iam.s3_iam_profile
  rds_iam_profile    = module.iam.rds_iam_profile
  rds_host           = module.rds.rds_host
  db_name            = module.rds.db_name
  db_port            = module.rds.db_port
  db_username        = module.rds.db_username
  sc_lb_id           = module.vpc.sc_lb_id
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  sc_ssh_id          = module.vpc.sc_ssh_id
  sc_apps_id         = module.vpc.sc_apps_id

}
