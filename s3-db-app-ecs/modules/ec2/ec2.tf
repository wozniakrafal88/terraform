resource "aws_instance" "ec2_bastion" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = var.ec2_associate_public_ip_address
  key_name                    = aws_key_pair.key_pair.key_name
  security_groups             = ["${var.sc_ssh_id}","${var.sc_apps_id}"]
  subnet_id                   = var.public_subnet_ids[1]
  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_bastion"
    Owner = var.tag_owner
  }
  iam_instance_profile = "${var.rds_to_ec2_iam_profile}"
}

/*resource "aws_instance" "ec2_db" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = ["${var.sc_apps_id}"]
  subnet_id       = var.private_subnet1_id
  tags = {
    Name  = "rwozniak2-apps_db"
    Owner = var.tag_owner
  }
  iam_instance_profile = "${var.rds_iam_profile}"
  user_data_replace_on_change = "true"
  user_data = templatefile("${path.module}/db_app_user_data.tftpl", {})
}*/

/*resource "aws_instance" "ec2_s3" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = ["${var.sc_apps_id}"]
  subnet_id       = var.private_subnet1_id
  tags = {
    Name  = "rwozniak2-apps_s3"
    Owner = var.tag_owner
  }
  iam_instance_profile = "${var.s3_iam_profile}"
  user_data_replace_on_change = "true"
  user_data = templatefile("${path.module}/s3_app_user_data.tftpl", {aws_lb_dns_name= aws_lb.load_balancer.dns_name})
}*/