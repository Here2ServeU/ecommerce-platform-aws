variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "lambda_iam_role_arn" {
  description = "IAM role ARN for the Lambda function"
  type        = string
}

variable "rds_allocated_storage" {
  description = "Allocated storage size for the RDS instance"
  type        = number
}

variable "rds_engine" {
  description = "Database engine type for RDS (e.g., mysql, postgres)"
  type        = string
}

variable "rds_engine_version" {
  description = "Database engine version for RDS"
  type        = string
}

variable "rds_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
}

variable "rds_db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "rds_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "rds_publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime environment for the Lambda function (e.g., python3.8, nodejs14.x)"
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

variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}
