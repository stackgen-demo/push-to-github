module "stackgen_d309b538-ebe5-45c4-a89b-c668c064f2fd" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "test-bucket"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

