module "stackgen_4b603f9f-f76a-4692-bb58-5ca9f2de44db" {
  source                           = "./modules/aws_athena"
  athena_engine_version            = "AUTO"
  bucket_name                      = module.stackgen_fa59c686-d820-4cea-81fd-1af869eddd78.bucket_name
  bytes_scanned_cutoff_per_query   = 10485760
  database_force_destroy           = false
  database_name                    = "somename"
  encrypt_query_results            = true
  encryption_option                = "SSE_KMS"
  expected_bucket_owner            = null
  kms_key                          = null
  query                            = "query"
  query_description                = null
  query_name                       = "queryname"
  query_results_encryption_option  = "SSE_KMS"
  require_encryption_configuration = false
  result_output_location           = null
  set_acl_configuration            = false
  tags                             = {}
  workgroup_description            = null
  workgroup_force_destroy          = false
  workgroup_name                   = "egname"
  workgroup_state                  = "ENABLED"
}

module "stackgen_fa59c686-d820-4cea-81fd-1af869eddd78" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "s3-complete-testing"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    owner = "Gaurav Chavan"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

