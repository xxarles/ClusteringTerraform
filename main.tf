
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }

    backend "s3" {
    bucket = "img-clstr-terraform"
    key    = "img-clstr/terraform_state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}


module "ImageUpload"{
  source     = "./ImageUpload"
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}