variable "env" {
  default = "prd"
}

# Profile configurations variables
variable "account" {
  default = "account"
}

variable "aws_profile" {
  default = "aws_profile"
}

variable "account_ids" {
  type = "map"

  default = {}
}

variable "region" {
  default = ""
}
