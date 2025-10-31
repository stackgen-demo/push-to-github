module "stackgen_001a15e3-9cdb-4b92-b4dc-7e19e4adce6d" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "test-appstack-bucket"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    release = "oct-2025"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

module "stackgen_bb02b275-fa8a-439b-a00b-c1a9bcea82bf" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "aws-athena-bucket-892323"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    release = "oct-2025"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

module "stackgen_f58d11ed-ea26-4c15-ab0e-bb981b9c2c67" {
  source                           = "./modules/aws_athena"
  athena_engine_version            = "AUTO"
  bucket_name                      = module.stackgen_001a15e3-9cdb-4b92-b4dc-7e19e4adce6d.bucket_name
  bytes_scanned_cutoff_per_query   = 10485760
  database_force_destroy           = false
  database_name                    = "testappstack"
  encrypt_query_results            = true
  encryption_option                = "SSE_KMS"
  expected_bucket_owner            = null
  kms_key                          = null
  query                            = "testAppstackQuery"
  query_description                = null
  query_name                       = "testAppstackWueryName"
  query_results_encryption_option  = "SSE_KMS"
  require_encryption_configuration = false
  result_output_location           = null
  set_acl_configuration            = false
  tags = {
    release = "oct-2025"
  }
  workgroup_description   = "testAppstackWD"
  workgroup_force_destroy = false
  workgroup_name          = "testAppstackWG"
  workgroup_state         = "ENABLED"
}

