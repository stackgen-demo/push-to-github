terraform {
  backend "s3" {
    bucket = "drift-detect-v3"
    key    = "deploy-s3-bucket.tfstate"
    region = "eu-west-2"
    encrypt = "false"
  }
}
