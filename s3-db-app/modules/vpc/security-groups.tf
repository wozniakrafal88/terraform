resource "aws_security_group" "sc_ssh" {
  name   = "${var.tag_name_prefix}-Security-Group-SSH"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks_for_bastion}"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.tag_name_prefix}-Security-Group-SSH"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_apps" {
  name   = "${var.tag_name_prefix}-Security-Group-Apps"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.tag_name_prefix}-Security-Group-Apps"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_db" {
  name   = "${var.tag_name_prefix}-Security-Group-DB"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.tag_name_prefix}-Security-Group-DB"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_lb" {
  name   = "${var.tag_name_prefix}-Security-Group-LB"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.tag_name_prefix}-Security-Group-LB"
    Owner = var.tag_owner
  }
}