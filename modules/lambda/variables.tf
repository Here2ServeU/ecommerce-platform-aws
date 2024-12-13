variable "iam_role_arn" {}
variable "lambda_source_dir" {}
variable "dynamodb_table_name" {}
variable "rds_endpoint" {}
variable "sns_topic_arn" {}
variable "environment" {}
# modules/lambda/variables.tf

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda"
  type        = string
}

variable "handler" {
  description = "The function entry point in the code"
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
}

variable "filename" {
  description = "The path to the deployment package"
  type        = string
}
