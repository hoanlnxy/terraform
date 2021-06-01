output "bucket_name" {
  value = "${module.tfbackend.bucket_name}"
}

output "bucket_arn" {
  value = "${module.tfbackend.bucket_arn}"
}

output "dynamodb_table" {
  value = "${module.tfbackend.dynamodb_table}"
}

output "dynamodb_table_arn" {
  value = "${module.tfbackend.dynamodb_table_arn}"
}
