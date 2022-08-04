variable "vpc_id" {
  type = string
}

variable "sc_db_id" {
  type = string
}

variable "private_subnet2_id" {
  type = string
}

variable "private_subnet1_id" {
  type = string
}

variable "rds_engine"{
  type = string
  default = "postgres"
}

variable "rds_engine_version"{
  type = string
  default = "13.4"
}

variable "rds_instance_class"{
  type = string
  default = "db.t3.micro"
}

variable "rds_identifier"{
  type = string
  default = "rwozniak2-db"
}

variable "rds_username"{
  type = string
  default = "postgres"
}

variable "rds_password"{
  type = string
  default = "password"
}

variable "rds_skip_final_snapshot"{
  type = bool
  default = true
}

variable "rds_iam_database_authentication_enabled"{
  type = bool
  default = true
}

variable "tag_owner"{
  type = string
}