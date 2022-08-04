resource "aws_vpc" "rwozniak2-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name  = "rwozniak2-vpc"
    Owner = var.tag_owner
  }
}