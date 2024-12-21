output "api_endpoint" {
  value = aws_apigatewayv2_api.api.api_endpoint
}

# Outputs
output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "invoke_url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}/${var.environment}"
}
