resource "aws_launch_template" "ec2_db_template" {
  name = "rwozniak2_ec2_db_template"

  image_id = var.ec2_ami
  
  instance_type = var.ec2_instance_type

  key_name = aws_key_pair.key_pair.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups  = [var.sc_apps_id]
    subnet_id = var.private_subnet1_id
  }
  iam_instance_profile {
    name = "${var.rds_iam_profile}"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name  = "rwozniak2-apps_db"
        Owner = var.tag_owner
    }
  }

  user_data = base64encode(templatefile("${path.module}/db_app_user_data.tftpl", {}))

}

resource "aws_launch_template" "ec2_s3_template" {
  name = "rwozniak2_ec2_s3_template"

  image_id = var.ec2_ami
  
  instance_type = var.ec2_instance_type

  key_name = aws_key_pair.key_pair.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups  = [var.sc_apps_id]
    subnet_id = var.private_subnet1_id
  }
  iam_instance_profile {
    name = "${var.s3_iam_profile}"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name  = "rwozniak2-apps_s3"
        Owner = var.tag_owner
    }
  }

  user_data = base64encode(templatefile("${path.module}/s3_app_user_data.tftpl", {aws_lb_dns_name= aws_lb.load_balancer.dns_name}))

}