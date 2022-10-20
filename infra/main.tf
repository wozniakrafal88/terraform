module "vpc" {
  source = "../modules/vpc"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
}

module "rds" {
  source = "../modules/rds"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  sc_db_id           = module.vpc.sc_db_id
}

module "iam" {
  source = "../modules/iam"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  resource_id = module.rds.resource_id
  arn         = module.rds.arn
}

module cloud_map {
  source = "../modules/cloud_map"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  vpc_id             = module.vpc.vpc_id
}

module ecr {
  source = "../modules/ecr"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
}
