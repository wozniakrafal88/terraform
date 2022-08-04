resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.rwozniak2-vpc.id

  tags = {
    Name  = "rwozniak2-igw"
    Owner = var.tag_owner
  }
}
