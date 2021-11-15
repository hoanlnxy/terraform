provider "aws" {
  allowed_account_ids = ["${var.account_ids[var.account]}"]
  region              = "${var.region}"
  profile             = "${var.aws_profile}"
  version             = ">=1.46.0"
}
