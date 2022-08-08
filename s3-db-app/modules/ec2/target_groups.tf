resource "aws_lb_target_group" "tg_db" {
  name        = "${var.env_name}-${var.tag_name_prefix}-tg-db"
  target_type = "instance"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

/*resource "aws_lb_target_group_attachment" "db_target" {
  target_group_arn = aws_lb_target_group.tg_db.arn
  target_id        = aws_instance.ec2_db.id
  port             = 5000
}*/

resource "aws_lb_target_group" "tg_s3" {
  name        = "${var.env_name}-${var.tag_name_prefix}-tg-s3"
  target_type = "instance"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

/*resource "aws_lb_target_group_attachment" "s3_target" {
  target_group_arn = aws_lb_target_group.tg_s3.arn
  target_id        = aws_instance.ec2_s3.id
  port             = 5000
}*/