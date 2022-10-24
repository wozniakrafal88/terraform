
terraform {
  backend "s3" {
    bucket         = "rwozniak-tfstate"
    key            = "tfstate/terraform_infra.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "rwozniak_locktable"
  }
}

