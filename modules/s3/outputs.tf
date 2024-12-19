output "bucket_name" {
  value = aws_s3_bucket.frontend.bucket
<<<<<<< HEAD
=======
}

output "bucket_domain_name" {
  value = aws_s3_bucket.frontend.bucket_domain_name
>>>>>>> 71afa0ec741a072a688a06f74eb4372d7052a9e1
}

output "bucket_domain_name" {
  value = aws_s3_bucket.frontend.bucket_domain_name
}