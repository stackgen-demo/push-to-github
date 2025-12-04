# named query resource
resource "aws_athena_named_query" "this" {
  name        = var.query_name
  description = var.query_description
  query       = var.query
  workgroup   = aws_athena_workgroup.this.id
  database    = aws_athena_database.this.name
}

# database resource
resource "aws_athena_database" "this" {
  name   = var.database_name
  bucket = var.bucket_name
  dynamic "acl_configuration" {
    for_each = var.set_acl_configuration ? [1] : []
    content {
      s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
    }
  }

  dynamic "encryption_configuration" {
    for_each = var.require_encryption_configuration ? [1] : []
    content {
      encryption_option = var.encryption_option
      kms_key           = var.kms_key
    }
  }

  expected_bucket_owner = var.expected_bucket_owner
  force_destroy         = var.database_force_destroy
}

resource "aws_kms_key" "aws_athena-result" {
  deletion_window_in_days = 7
  description             = "Athena KMS Key"
}

resource "aws_kms_key" "athena_result_encryption" {
  count               = var.encrypt_query_results && var.query_results_encryption_option != "SSE_S3" ? 1 : 0
  description         = "Custom KMS key for Athena query result encryption."
  enable_key_rotation = true
}

# workgroup resource
resource "aws_athena_workgroup" "this" {
  name          = var.workgroup_name
  description   = var.workgroup_description
  state         = var.workgroup_state
  force_destroy = var.workgroup_force_destroy
  tags          = var.tags

  configuration {
    bytes_scanned_cutoff_per_query = var.bytes_scanned_cutoff_per_query
    engine_version {
      selected_engine_version = var.athena_engine_version
    }
    result_configuration {
      dynamic "encryption_configuration" {
        for_each = var.encrypt_query_results ? [1] : []
        content {
          encryption_option = var.query_results_encryption_option
          kms_key_arn       = aws_kms_key.athena_result_encryption[0].arn
        }
      }
      dynamic "acl_configuration" {
        for_each = var.set_acl_configuration ? [1] : []
        content {
          s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
        }
      }
      output_location = var.result_output_location
    }
  }
}






