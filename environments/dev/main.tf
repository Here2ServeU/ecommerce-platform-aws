terraform {
  backend "s3" {
    bucket         = var.backend_bucket_name
    key            = var.backend_key
    region         = var.backend_region
    dynamodb_table = var.backend_dynamodb_table
    encrypt        = var.backend_encrypt
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 Module
module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
}

# DynamoDB Module
module "dynamodb" {
  source      = "../../modules/dynamodb"
  table_name  = var.dynamodb_table_name
  environment = var.environment
}

# RDS Module
module "rds" {
  source               = "../../modules/rds"
  allocated_storage    = var.rds_allocated_storage
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.rds_db_name
  username             = var.rds_username
  password             = var.rds_password
  publicly_accessible  = var.rds_publicly_accessible
  environment          = var.environment
}

# SNS Module
module "sns" {
  source      = "../../modules/sns"
  topic_name  = var.sns_topic_name
  environment = var.environment
}

# Lambda Module
module "lambda" {
  source              = "../../modules/lambda"
  function_name       = var.lambda_function_name
  iam_role_arn        = module.iam.role_arn
  dynamodb_table_name = module.dynamodb.table_name
  rds_endpoint        = module.rds.db_endpoint
  sns_topic_arn       = module.sns.topic_arn
  environment         = var.environment
  lambda_source_dir   = var.lambda_source_dir
  runtime             = var.lambda_runtime
  filename            = var.lambda_filename
  handler             = var.lambda_handler
  lambda_role_name    = var.lambda_role_name
}

# IAM Module
module "iam" {
  source    = "../../modules/iam"
  role_name = var.role_name
}

# Cloudfront Module
module "cloudfront" {
  source            = "../../modules/cloudfront"
  bucket_name       = module.s3.bucket_name
  bucket_domain_name = module.s3.bucket_domain_name
  environment       = var.environment
}

# Cognito Module
module "cognito" {
  source             = "../../modules/cognito"
  user_pool_name     = var.cognito_user_pool_name
  identity_pool_name = var.cognito_identity_pool_name
  environment        = var.environment
}

# API Module
module "api_gateway" {
  source              = "../../modules/api_gateway"
  api_name            = var.api_name
  environment         = var.environment
  lambda_function_arn = module.lambda.function_arn
  region              = var.aws_region
}
