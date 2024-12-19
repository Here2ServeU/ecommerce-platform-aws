variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment where to deploy"
  type = string
}
