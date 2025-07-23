module "stackgen_27409e31-132a-4297-9059-3ff8d7ae8213" {
  source           = "./modules/aws_nat_gateway_with_eip"
  create_eip       = "true"
  nat_gateway_name = "some_name"
  subnet_id        = "subnet-xxxxxxxxxxxxxxxxx"
}

module "stackgen_32e26297-c006-4fee-94e9-b7b3e93281ee" {
  source             = "./modules/aws_iam_role"
  assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
}

module "stackgen_392c67f8-2d55-59ea-a942-d91ecc986c83" {
  source                = "./modules/aws_lambda"
  architecture          = "x86_64"
  authorization_type    = "NONE"
  cors                  = []
  create_function_url   = false
  description           = null
  environment_variables = {}
  event_source_arn      = null
  event_source_mapping  = []
  filename              = null
  function_name         = "stackgen_87e517-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_55b44ffd-94ed-557f-88bd-1d56734f5519.name
  memory_size           = 128
  role                  = module.stackgen_47096752-05d0-57b8-b350-a13e9b5a7c19.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_3b084fac-76d6-4866-b832-482defe9db45" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
}

module "stackgen_451dae65-d79f-4f2a-8a1b-f0246001cb58" {
  source = "./modules/aws_subnet"
  vpc_id = module.stackgen_3b084fac-76d6-4866-b832-482defe9db45.id
}

module "stackgen_47096752-05d0-57b8-b350-a13e9b5a7c19" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Action\": \"sts:AssumeRole\",\"Effect\": \"Allow\",\"Principal\": {\"Service\": \"lambda.amazonaws.com\"}}]}"
  description           = "IAM role for Lambda function to access DynamoDB and CloudWatch Logs."
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "lambda_dynamodb_cloudwatch_role"
  path                  = "/"
  permissions_boundary  = null
  tags                  = {}
}

module "stackgen_55b44ffd-94ed-557f-88bd-1d56734f5519" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_87e517-function"
  retention_in_days = "30"
  tags              = {}
}

module "stackgen_55e617b6-957d-439f-8689-c25a6c2e0b3e" {
  source                       = "./modules/aws_s3"
  bucket_name                  = "BUCKET_NAME"
  enable_website_configuration = "false"
  website_error_document       = "ERROR_DOCUMENT"
  website_index_document       = "INDEX_DOCUMENT"
}

module "stackgen_6ac5717b-7b2a-4814-86a8-9f9b817636e0" {
  source      = "./modules/aws_sg"
  description = "Security group for the custom VPC"
  name        = "custom-vpc-sg"
}

module "stackgen_7c4f5b9f-d3a0-4d3e-b141-fac7497f304d" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_f61eb3"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup55b44ffd94ed557f88bd1d56734f55190\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_55b44ffd-94ed-557f-88bd-1d56734f5519.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup55b44ffd94ed557f88bd1d56734f55191\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_55b44ffd-94ed-557f-88bd-1d56734f5519.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_47096752-05d0-57b8-b350-a13e9b5a7c19.name
  role_type = "Writer"
}

module "stackgen_b57496c2-2c9b-4e3f-9f2d-f7f6fd89ef52" {
  source = "./modules/aws_eip_composite"
  name   = "some_name"
}

module "stackgen_cb0995de-c5ce-4f72-8c69-7f61cb3326fe" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "my-log-group"
  retention_in_days = 30
  tags = {
    environment = "production"
  }
}

module "stackgen_d35c94fb-1203-4f9b-bd77-fed58630ad32" {
  source     = "./modules/aws_route_table_composite"
  name       = "route-table-name"
  routes     = []
  subnet_ids = []
  vpc_id     = "vpc-id"
}

module "stackgen_e461f19b-faca-4753-9fca-986858b4aeb5" {
  source = "./modules/aws_internet_gateway"
  tags   = "{\"Name\": \"internet-gateway\"}"
  vpc_id = null
}

module "stackgen_e6de8357-2bf7-4668-a6dd-1f6efac90dbc" {
  source = "./modules/aws_subnet"
  vpc_id = module.stackgen_3b084fac-76d6-4866-b832-482defe9db45.id
}

module "stackgen_f0ed6411-1f8b-4363-a8c2-8f6868b90e1d" {
  source = "./modules/aws_dynamodb"
  attribute = [{
    name = "attribute1"
    type = "type1"
  }]
  billing_mode                   = "PROVISIONED"
  global_secondary_indexes       = []
  hash_key                       = "string"
  local_secondary_indexes        = []
  point_in_time_recovery_enabled = true
  read_capacity                  = null
  server_side_encryption_enabled = true
  table_name                     = "string"
  tags                           = {}
  ttl                            = []
  write_capacity                 = null
}

