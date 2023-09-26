module "ec2" {
  source = "git@github.com:luizy28/s3-backend-repo.git//ec2-module?"
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
    key     = "ec2/terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

