variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "bucket_name" {
  default     = "deployable-iac-bucket-122025"
  description = "The name of the s3 bucket"
  type        = string
  nullable    = false
  sensitive   = false
}

