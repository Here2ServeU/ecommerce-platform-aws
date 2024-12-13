resource "aws_s3_bucket" "frontend" {
  bucket        = var.bucket_name
  acl           = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

output "bucket_name" {
  value = aws_s3_bucket.frontend.id
}

output "website_endpoint" {
  value = aws_s3_bucket.frontend.website_endpoint
}
