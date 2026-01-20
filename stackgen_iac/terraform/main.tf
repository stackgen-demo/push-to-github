module "stackgen_74c0ac7c-39ec-4dcd-bcd2-e6ab4e00ee1f" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "dgtshteha"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

