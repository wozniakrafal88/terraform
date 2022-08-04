resource "aws_db_instance" "rds" {
  allocated_storage                   = 10
  engine                              = var.rds_engine
  engine_version                      = var.rds_engine_version
  instance_class                      = var.rds_instance_class
  identifier                          = var.rds_identifier
  username                            = var.rds_username
  password                            = var.rds_password
  skip_final_snapshot                 = var.rds_skip_final_snapshot
  db_subnet_group_name                = aws_db_subnet_group.db_subnet.id
  iam_database_authentication_enabled = var.rds_iam_database_authentication_enabled
  vpc_security_group_ids              = ["${var.sc_db_id}"]
  tags = {
    Name  = "rwozniak2-db"
    Owner = var.tag_owner
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "rwozniak2_db_subnet"
  subnet_ids = [var.private_subnet2_id, var.private_subnet1_id]

  tags = {
    Name  = "rwozniak2_db_subnet"
    Owner = var.tag_owner
  }

}