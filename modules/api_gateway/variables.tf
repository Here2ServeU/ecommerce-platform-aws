variable "api_name" {
  description = "Name of the API"
  type        = string
}

variable "environment" {
  description = "Environment for the API (e.g., dev, stage, prod)"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function to integrate with"
  type        = string
}
