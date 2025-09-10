module "stackgen_3a590471-d3a7-437e-b583-8204be7431c3" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "deploy-bucket-289323"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    owner = "qa"
    team  = "qa"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

