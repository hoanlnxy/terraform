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

variable "short_region" {
  default = ""
}

variable "db_user" {
  default = "root"
}

variable "db_identifier" {
  description = "DB name/identifier"
}

variable "db_port" {
  default = 3306
}

variable "db_password" {
  description = "Password for the db user"
}


