variable "tag_owner"{
  type = string
  default = "rwozniak"
}

variable "tag_name_prefix"{
  type = string
  default = "rwozniak"
}

variable "env_name" {
  type = string
  default = "test"
}

variable "s3_app_image_tag" {
  type = string
  default = "latest"
}

variable "db_app_image_tag" {
  type = string
  default = "latest"
}