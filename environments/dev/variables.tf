variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "t2s-dev-frontend"
}

variable "dynamodb_table_name" {
  default = "t2s-dev-table"
}

variable "lambda_iam_role_arn" {
  default = "arn:aws:iam::123456789012:role/lambda-execution-role"
}

variable "rds_allocated_storage" {
  default = 20
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_engine_version" {
  default = "8.0"
}

variable "rds_instance_class" {
  default = "db.t3.micro"
}

variable "rds_db_name" {
  default = "t2s_dev_db"
}

variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "securepassword"
}

variable "rds_publicly_accessible" {
  default = false
}

variable "sns_topic_name" {
  default = "t2s-dev-sns-topic"
}

variable "environment" {
  default = "dev"
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function (e.g., python3.8, nodejs14.x)"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
}
variable "lambda_filename" {
  description = "The path to the function's deployment package within the local filesystem"
  type        = string
}

variable "lambda_handler" {
  description = "The function entry point in your code"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role to create"
  type        = string
}

