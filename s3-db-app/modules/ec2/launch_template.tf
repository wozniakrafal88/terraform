resource "aws_launch_template" "ec2_db_template" {
  name = "${var.tag_name_prefix}_ec2_db_template"

  image_id = var.ec2_ami
  
  instance_type = var.ec2_instance_type

  key_name = aws_key_pair.key_pair.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups  = [var.sc_apps_id]
    subnet_id = "${var.private_subnet_ids[0]}"
  }
  iam_instance_profile {
    name = "${var.rds_iam_profile}"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name  = "${var.tag_name_prefix}-apps_db"
        Owner = var.tag_owner
    }
  }

  user_data = base64encode(templatefile("${path.module}/flask_app_user_data.tftpl", {yum_programs = ["pip", "git", "postgresql.x86_64"], pip_programs = ["Flask", "sqlAlchemy", "psycopg2-binary", "boto3", "jsonify"], git_url = "https://github.com/wozniakrafal88/test_app.git", env_variables = ["RDSHOST=rwozniak2-db.cn10audml9ef.eu-west-1.rds.amazonaws.com", "DB_DBNAME=flask_db", "DB_PORT=5432", "DB_USERNAME=dbtest", "AWS_REGION=eu-west-1"], app_name = "test_app"}))

}

resource "aws_launch_template" "ec2_s3_template" {
  name = "${var.tag_name_prefix}_ec2_s3_template"

  image_id = var.ec2_ami
  
  instance_type = var.ec2_instance_type

  key_name = aws_key_pair.key_pair.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups  = [var.sc_apps_id]
    subnet_id = "${var.private_subnet_ids[0]}"
  }
  iam_instance_profile {
    name = "${var.s3_iam_profile}"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name  = "${var.tag_name_prefix}-apps_s3"
        Owner = var.tag_owner
    }
  }

  user_data = base64encode(templatefile("${path.module}/flask_app_user_data.tftpl", {yum_programs = var.s3_yum_programs, pip_programs = var.s3_pip_programs, git_url = var.s3_git_url, env_variables = ["BUCKET_NAME=rwozniak-s3", "DB_API_URL=http://${aws_lb.load_balancer.dns_name}/db/API_number_of_books/"], app_name = "s3_app"}))

}