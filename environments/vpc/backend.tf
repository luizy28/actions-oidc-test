terraform {
  backend "s3" {
    bucket  = "bootcamp32-dev-13"
    region  = "us-west-2"
    key     = "oidc/terraform.tfstate"
    encrypt = true
  }
}