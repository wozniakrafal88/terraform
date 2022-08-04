module "rds" {
  source = "./modules/rds"

  tag_owner          = var.tag_owner
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
  vpc_id             = module.vpc.vpc_id
  sc_db_id           = module.vpc.sc_db_id
}

module "iam" {
  source = "./modules/iam"

  tag_owner          = var.tag_owner
  resource_id = module.rds.resource_id
  arn         = module.rds.arn
}

module "ec2" {
  source = "./modules/ec2"

  tag_owner          = var.tag_owner
  s3_iam_profile     = module.iam.s3_iam_profile
  rds_iam_profile    = module.iam.rds_iam_profile
  sc_lb_id           = module.vpc.sc_lb_id
  vpc_id             = module.vpc.vpc_id
  public_subnet2_id  = module.vpc.public_subnet2_id
  private_subnet1_id = module.vpc.private_subnet1_id
  public_subnet1_id  = module.vpc.public_subnet1_id
  sc_ssh_id          = module.vpc.sc_ssh_id
  sc_apps_id         = module.vpc.sc_apps_id

}
