
output "vpc_id" {
  value = aws_vpc.rwozniak2-vpc.id
}

output "sc_db_id" {
  value = aws_security_group.sc_db.id
}


output "sc_ssh_id" {
  value = aws_security_group.sc_ssh.id
}

output "sc_lb_id" {
  value = aws_security_group.sc_lb.id
}

output "sc_apps_id" {
  value = aws_security_group.sc_apps.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}
