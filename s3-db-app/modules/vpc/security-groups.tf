resource "aws_security_group" "sc_ssh" {
  name   = "rwozniak2-Security-Group-SSH"
  vpc_id = aws_vpc.rwozniak2-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["188.114.87.23/32"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "rwozniak2-Security-Group-SSH"
    Owner = "rwozniak"
  }
}

resource "aws_security_group" "sc_apps" {
  name   = "rwozniak2-Security-Group-Apps"
  vpc_id = aws_vpc.rwozniak2-vpc.id

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
    Name  = "rwozniak2-Security-Group-Apps"
    Owner = "rwozniak"
  }
}

resource "aws_security_group" "sc_db" {
  name   = "rwozniak2-Security-Group-DB"
  vpc_id = aws_vpc.rwozniak2-vpc.id

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
    Name  = "rwozniak2-Security-Group-DB"
    Owner = "rwozniak"
  }
}

resource "aws_security_group" "sc_lb" {
  name   = "rwozniak2-Security-Group-LB"
  vpc_id = aws_vpc.rwozniak2-vpc.id

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
    Name  = "rwozniak2-Security-Group-LB"
    Owner = "rwozniak"
  }
}