provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  profile             = "${var.aws_profile}"
  region              = "${var.region}"
  version             = ">=1.46.0"
}

data "aws_caller_identity" "current" {}

terraform {
  required_version = ">= 0.11.1"
}
