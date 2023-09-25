module "ec2" {
  source = "git@github.com:luizy28/s3-backend-repo.git//ec2-module?"
}

resource "aws_instance" "demo_ec2" {
  ami       = data.aws_ami.demo_ec2.id
  subnet_id = data.terraform_remote_state.network.outputs.public_subnets[1]
  instance_type = var.instance_type

  tags = {
    "Name" = "demo_ec2"
  }
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
  region = "us-east-1"
}

#Declaring the data source for the vpc in the remote backend
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "bootcamp32-dev-13"
    key    = "oidc/terraform.tfstate"
    region = "us-east-1"
  }
}