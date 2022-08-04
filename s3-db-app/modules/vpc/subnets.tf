resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.rwozniak2-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name  = "rwozniak2-pub-subnet1"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.rwozniak2-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name  = "rwozniak2-pub-subnet2"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.rwozniak2-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name  = "rwozniak2-priv-subnet1"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.rwozniak2-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name  = "rwozniak2-priv-subnet2"
    Owner = var.tag_owner
  }
}