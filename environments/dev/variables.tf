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

variable "rds_endpoint" {
  default = "t2s-dev-db-endpoint"
}

variable "sns_topic_arn" {
  default = "arn:aws:sns:us-east-1:123456789012:t2s-dev-topic"
}

variable "environment" {
  default = "dev"
}
