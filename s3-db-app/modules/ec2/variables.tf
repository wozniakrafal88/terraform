variable "vpc_id" {
  type = string
}

variable "sc_lb_id" {
  type = string
}


variable "public_subnet2_id" {
  type = string
}

variable "sc_ssh_id" {
  type = string
}

variable "sc_apps_id" {
  type = string
}

variable "public_subnet1_id" {
  type = string
}

variable "private_subnet1_id" {
  type = string
}

variable "rds_iam_profile" {
  type = string
}

variable "s3_iam_profile" {
  type = string
}

variable "ec2_ami" {
  type = string
  default = "ami-0d71ea30463e0ff8d"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_associate_public_ip_address" {
  type = bool
  default = true
}

variable "tag_owner"{
  type = string
}