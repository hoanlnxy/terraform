terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "devops-terraform-state"
    key            = "terraform/prd/ap-southeast-1/rds/terraform.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"
    dynamodb_table = "devops-tf-state-lock"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket  = "devops-terraform-state"
    key     = "terraform/prd/ap-southeast-1/vpc/terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}

#data "terraform_remote_state" "sg" {
#  backend = "s3"
#
#  config {
#    bucket  = "devops-terraform-state"
#    key     = "terraform/prd/ap-southeast-1/sg/terraform.tfstate"
#    region  = "ap-southeast-1"
#    profile = "default"
#  }
#}
