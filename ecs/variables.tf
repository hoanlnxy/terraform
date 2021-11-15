variable "env" {
  default = ""
}

variable "aws_profile" {
  default = "aws_profile"
}

variable "aws_account_id" {
  description = "The aws account id for the tf backend creation (e.g. 857026751867)"
}

variable "region" {
  default = "region"
}

variable "short_region" {
  default = ""
}

variable "app_name" {
  description = "application name"
}

variable "app_environment" {
  description = "application enviroment"
}
