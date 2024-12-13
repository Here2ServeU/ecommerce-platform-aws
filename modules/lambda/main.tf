resource "aws_lambda_function" "backend" {
  function_name = var.function_name
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = var.iam_role_arn

  filename         = var.lambda_package
  source_code_hash = filebase64sha256(file(var.lambda_package))

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
      RDS_ENDPOINT   = var.rds_endpoint
      SNS_TOPIC_ARN  = var.sns_topic_arn
    }
  }

  tags = {
    Name        = var.function_name
    Environment = var.environment
  }
}
