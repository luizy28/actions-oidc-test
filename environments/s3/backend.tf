module "s3" {
  source = "git@github.com:luizy28/s3-backend-repo.git//s3-module?ref=v1.4.0"
}

#backend configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "bootcamp32-dev-13"
    region  = "us-east-1"
    key     = "action/terraform.tfstate"
    encrypt = true
  } 
}

provider "aws" {
  region = "us-east-1"
}