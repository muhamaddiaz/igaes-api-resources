output "igaes_user_pool_arn" {
  value = aws_cognito_user_pool.igaes_user_pool.arn
}

output "igaes_user_pool_client_id" {
  value = aws_cognito_user_pool_client.igaes_user_client.id
}

output "igaes_identity_pool_id" {
  value = aws_cognito_identity_pool.igaes_identity_pool.id
}

output "igaes_user_pool_domain" {
  value = "https://${aws_cognito_user_pool_domain.igaes_user_pool_domain.domain}.auth.ap-southeast-1.amazoncognito.com"
}
