resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name  = "${var.tag_name_prefix}-vpc"
    Owner = var.tag_owner
  }
}