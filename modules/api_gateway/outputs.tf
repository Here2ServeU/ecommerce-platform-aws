output "api_endpoint" {
  description = "Invoke URL for the API Gateway"
  value       = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/${var.environment}"
}

# Outputs
output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "invoke_url" {
  description = "Base invoke URL for the API Gateway"
  value       = "${aws_api_gateway_rest_api.api.execution_arn}/${var.environment}"
}
