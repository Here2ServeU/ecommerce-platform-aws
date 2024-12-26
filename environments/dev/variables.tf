# Backend
backend_bucket_name    = "t2s-ecommerce-tf-state"
backend_key            = "ecommerce/terraform.tfstate"
backend_region         = "us-east-1"
backend_dynamodb_table = "t2s-terraform-locks"
backend_encrypt        = true

# General
aws_region             = "us-east-1"
environment            = "dev"

# S3
bucket_name            = "t2s-dev-frontend"

# DynamoDB
dynamodb_table_name    = "t2s-dev-table"

# RDS
rds_allocated_storage  = 20
rds_engine             = "mysql"
rds_engine_version     = "8.0"
rds_instance_class     = "db.t3.micro"
rds_db_name            = "t2s_dev_db"
rds_username           = "admin"
rds_password           = "securepassword"
rds_publicly_accessible = false

# SNS
sns_topic_name         = "t2s-dev-sns-topic"

# Lambda
lambda_function_name   = "t2s-backend-dev-function"
lambda_source_dir      = "../lambda_code"
lambda_runtime         = "python3.8"
lambda_filename        = "lambda_function.zip"
lambda_handler         = "app.handler"
lambda_role_name       = "lambda-execution-role"

# IAM
role_name              = "t2s-iam-role"

# Cognito
cognito_user_pool_name = "t2s-user-pool-dev"
cognito_identity_pool_name = "t2s-identity-pool-dev"

# API Gateway
api_name               = "t2s-api"
