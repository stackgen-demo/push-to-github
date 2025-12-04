module "stackgen_49ed8486-d785-4365-807c-4f4fc382e725" {
  source                           = "./modules/aws_athena"
  athena_engine_version            = "AUTO"
  bucket_name                      = module.stackgen_bc9dd521-c8a6-475f-9053-6b808a50cc21.bucket_name
  bytes_scanned_cutoff_per_query   = 10485760
  database_force_destroy           = false
  database_name                    = "test_data"
  encrypt_query_results            = true
  encryption_option                = "SSE_KMS"
  expected_bucket_owner            = null
  kms_key                          = null
  query                            = "sqmple query"
  query_description                = null
  query_name                       = "sg query"
  query_results_encryption_option  = "SSE_KMS"
  require_encryption_configuration = false
  result_output_location           = null
  set_acl_configuration            = false
  tags = {
    purpose = "testing"
    release = "nov-2025"
  }
  workgroup_description   = "sample wg"
  workgroup_force_destroy = false
  workgroup_name          = "sample eg name"
  workgroup_state         = "ENABLED"
}

module "stackgen_bc9dd521-c8a6-475f-9053-6b808a50cc21" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = var.bucket_name
  enable_versioning            = true
  enable_website_configuration = true
  sse_algorithm                = "aws:kms"
  tags = {
    name    = "testbucket"
    purpose = "testing"
    release = "nov-2025"
  }
  website_error_document = "error.html"
  website_index_document = "index.html"
}

