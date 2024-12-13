provider "aws" {
  region = var.aws_region
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "dynamodb" {
  source      = "../../modules/dynamodb"
  table_name  = var.dynamodb_table_name
  environment = var.environment
}

module "lambda" {
  source              = "../../modules/lambda"
  function_name       = "t2s-backend-dev-function"
  iam_role_arn        = var.lambda_iam_role_arn
  lambda_package      = "lambda_function.zip"
  dynamodb_table_name = module.dynamodb.table_name
  rds_endpoint        = var.rds_endpoint
  sns_topic_arn       = var.sns_topic_arn
  environment         = var.environment
}

module "api_gateway" {
  source              = "../../modules/api_gateway"
  api_name            = "t2s-dev-api"
  lambda_function_arn = module.lambda.function_arn
}
