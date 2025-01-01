variable "backend_bucket_name" {
  description = "S3 bucket for storing the Terraform backend state"
  type        = string
}

variable "backend_key" {
  description = "Key for the Terraform state file"
  type        = string
}

variable "backend_region" {
  description = "AWS region for the backend"
  type        = string
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}

variable "backend_encrypt" {
  description = "Enable encryption for the backend state"
  type        = bool
}

variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for the frontend"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "rds_allocated_storage" {
  description = "Allocated storage for RDS"
  type        = number
}

variable "rds_engine" {
  description = "RDS engine (e.g., mysql, postgres)"
  type        = string
}

variable "rds_engine_version" {
  description = "Version of the RDS engine"
  type        = string
}

variable "rds_instance_class" {
  description = "Instance class for RDS"
  type        = string
}

variable "rds_db_name" {
  description = "Database name for RDS"
  type        = string
}

variable "rds_username" {
  description = "Username for RDS"
  type        = string
}

variable "rds_password" {
  description = "Password for RDS"
  type        = string
}

variable "rds_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_source_dir" {
  description = "Directory containing Lambda source code"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "lambda_filename" {
  description = "Filename of the Lambda deployment package"
  type        = string
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "IAM role name for the Lambda function"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "cognito_user_pool_name" {
  description = "Cognito User Pool name"
  type        = string
}

variable "cognito_identity_pool_name" {
  description = "Cognito Identity Pool name"
  type        = string
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}
