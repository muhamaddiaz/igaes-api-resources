output "igaes_bucket_arn" {
  value = aws_s3_bucket.igaes_s3_bucket.arn
}

output "igaes_bucket_name" {
  value = aws_s3_bucket.igaes_s3_bucket.bucket_domain_name
}
