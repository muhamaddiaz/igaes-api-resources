output "igaes_user_pool_arn" {
  value = module.igaes_auth.igaes_user_pool_arn
}

output "igaes_user_pool_client_id" {
  value = module.igaes_auth.igaes_user_pool_client_id
}

output "igaes_identity_pool_id" {
  value = module.igaes_auth.igaes_identity_pool_id
}

output "igaes_user_pool_domain" {
  value = module.igaes_auth.igaes_user_pool_domain
}

output "igaes_bucket_arn" {
  value = module.igaes_bucket.igaes_bucket_arn
}

output "igaes_bucket_name" {
  value = module.igaes_bucket.igaes_bucket_name
}
