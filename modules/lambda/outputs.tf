output "function_arn" {
  value = aws_lambda_function.backend.arn
}

output "function_name" {
  value = aws_lambda_function.backend.function_name
}
