resource "aws_autoscaling_group" "db_app_asg" {
  name = "rwozniak2_db_app_asg"
  vpc_zone_identifier = ["${var.private_subnet1_id}"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.ec2_db_template.id
  }
  target_group_arns  = ["${aws_lb_target_group.tg_db.arn}"]
}


resource "aws_autoscaling_group" "s3_app_asg" {
  name = "rwozniak2_s3_app_asg"
  vpc_zone_identifier = ["${var.private_subnet1_id}"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.ec2_s3_template.id
  }
  target_group_arns  = ["${aws_lb_target_group.tg_s3.arn}"]
}