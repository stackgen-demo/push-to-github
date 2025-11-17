module "stackgen_d0349fc8-52ae-4f3d-9acd-1c0620707b33" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "push-to-git-vault"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    delete  = "true"
    purpose = "push-to-git-vault"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

