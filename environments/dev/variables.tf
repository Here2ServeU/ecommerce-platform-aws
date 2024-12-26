# Terraform Backend Variables
variable "backend_bucket_name" {
  description = "Name of the S3 bucket used for the backend state"
  type        = string
}

variable "backend_key" {
  description = "Path to the backend state file"
  type        = string
}

variable "backend_region" {
  description = "AWS region for the backend"
  type        = string
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for state locking"
  type        = string
}

variable "backend_encrypt" {
  description = "Whether to enable encryption for the backend"
  type        = bool
}

# General Variables
variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
}

# S3 Variables
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# DynamoDB Variables
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

# RDS Variables
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

# SNS Variables
variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

# Lambda Variables
variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_source_dir" {
  description = "Path to the directory containing Lambda function code"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime environment for the Lambda function"
  type        = string
}

variable "lambda_filename" {
  description = "Name of the Lambda deployment package"
  type        = string
}

variable "lambda_handler" {
  description = "The entry point handler for the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "Name of the IAM role for the Lambda function"
  type        = string
}

# IAM Variables
variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

# Cognito Variables
variable "cognito_user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "cognito_identity_pool_name" {
  description = "Name of the Cognito Identity Pool"
  type        = string
}

# API Gateway Variables
variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}
