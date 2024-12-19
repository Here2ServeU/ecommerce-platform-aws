# S3 Bucket
resource "aws_s3_bucket" "frontend" {
  bucket = "t2s-dev-frontend"
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.frontend.arn}/*"
      },
    ]
  })
}

# Pre-Destroy Bucket Cleanup for Non-Versioned Buckets
resource "null_resource" "frontend_cleanup_non_versioned" {
  triggers = {
    bucket_name = aws_s3_bucket.frontend.id
  }

  provisioner "local-exec" {
    command = <<EOT
      aws s3 rm s3://${aws_s3_bucket.frontend.id} --recursive || true
    EOT
  }

  depends_on = [aws_s3_bucket.frontend]
}

# Pre-Destroy Bucket Cleanup for Versioned Buckets
resource "null_resource" "frontend_cleanup_versioned" {
  triggers = {
    bucket_name = aws_s3_bucket.frontend.id
  }

  provisioner "local-exec" {
    command = <<EOT
      aws s3api delete-objects --bucket ${aws_s3_bucket.frontend.id} --delete "$(aws s3api list-object-versions --bucket ${aws_s3_bucket.frontend.id} --query '{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
    EOT
  }

  depends_on = [aws_s3_bucket.frontend]
}

# S3 Bucket with Cleanup Dependencies
resource "aws_s3_bucket" "frontend" {
  bucket = "t2s-dev-frontend"

  lifecycle {
    prevent_destroy = false
  }

  depends_on = [
    null_resource.frontend_cleanup_non_versioned,
    null_resource.frontend_cleanup_versioned
  ]
}
