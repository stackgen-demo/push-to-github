module "stackgen_79c2c0db-0b3a-4e3e-8f59-a2247efd188a" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = var.bucket_name
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    delete    = "false"
    purpose   = "testing"
    team      = "qa"
    to-delete = "false"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

