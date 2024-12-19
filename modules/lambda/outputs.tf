output "function_arn" {
  value = aws_lambda_function.backend.arn
  description = "The ARN of the Lambda function"
}