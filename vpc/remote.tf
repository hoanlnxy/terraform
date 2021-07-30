terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "hoanln-terraform-state"
    key            = "terraform/prd/ap-southeast-1/vpc/terraform.tfstate"
    profile        = "prd"
    region         = "ap-southeast-1"
    dynamodb_table = "hoanln-tf-state-lock"
  }
}

