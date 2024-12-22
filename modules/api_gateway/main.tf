# API Gateway REST API
resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.api_name}-${var.environment}"
  description = "API for the ${var.environment} environment of the T2S E-commerce Platform"
}

# Resource for the `/enroll` route
resource "aws_api_gateway_resource" "enroll" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "enroll"
}

# POST Method for the `/enroll` route
resource "aws_api_gateway_method" "post_enroll" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.enroll.id
  http_method   = "POST"
  authorization = "NONE" # Change to AWS_IAM or CUSTOM if using authentication
}

# Integration with Lambda for the POST `/enroll` method
resource "aws_api_gateway_integration" "post_enroll" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.enroll.id
  http_method             = aws_api_gateway_method.post_enroll.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_function_arn # Use the variable instead of a direct reference
}

# Deployment for the API
resource "aws_api_gateway_deployment" "deployment" {
  depends_on  = [aws_api_gateway_integration.post_enroll]
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = var.environment
}

