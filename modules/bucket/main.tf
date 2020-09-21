resource "aws_s3_bucket" "igaes_s3_bucket_log" {
  bucket = "${var.stage}-igaes-bucket-log"
  acl = "log-delivery-write"
  tags = var.tags
}

resource "aws_s3_bucket" "igaes_s3_bucket" {
  bucket = "${var.stage}-igaes-bucket"
  acl = "private"
  cors_rule {
    allowed_methods = [
      "GET", "POST", "PUT", "DELETE", "HEAD"
    ]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
  logging {
    target_bucket = aws_s3_bucket.igaes_s3_bucket_log.id
    target_prefix = "log/"
  }
  tags = var.tags
}
