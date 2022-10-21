data "terraform_remote_state" "infra_state"{
  backend = "s3"
    config = {
      bucket = "rwozniak-tfstate"
      key = "tfstate/terraform_infra.tfstate"
      region  = "eu-west-1"
  }
}
