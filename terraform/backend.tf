terraform {
  backend "s3" {
    bucket = "drift-detect-v3"
    key    = "s3-complete-testing.tfstate"
    region = "eu-west-2"
    encrypt = "false"
  }
}
