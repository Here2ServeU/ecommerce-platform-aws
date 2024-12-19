output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}

output "identity_pool_id" {
  value = aws_cognito_identity_pool.identity_pool.id
}
