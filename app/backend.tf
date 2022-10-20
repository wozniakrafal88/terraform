
terraform {
  backend "s3" {
    bucket         = "rwozniak-tfstate"
    key            = "tfstate/terraform_app.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "rwozniak_locktable"
  }
}

