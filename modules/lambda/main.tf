data "archive_file" "lambda_package" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_code"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "backend" {
  function_name = var.function_name
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = var.iam_role_arn

  filename         = data.archive_file.lambda_package.output_path
  source_code_hash = data.archive_file.lambda_package.output_base64sha256

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
