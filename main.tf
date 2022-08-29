
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




module "SharedResources"{
  source              = "./SharedResources"
  account_id          = data.aws_caller_identity.current.account_id
  region              = data.aws_region.current.name
  oauth_client_id     = var.OAUTH_CLIENT_ID
  oauth_client_secret = var.OAUTH_CLIENT_SECRET
}


module "ImageUpload"{
  source                    = "./ImageUpload"
  account_id                = data.aws_caller_identity.current.account_id
  region                    = data.aws_region.current.name
  cognito_arn               = ["${module.SharedResources.cognito_arn_dev}"]
  cognito_scope_identifiers = module.SharedResources.cognito_scope_identifiers
}

module "ImageEmbedding"{
  source                    = "./ImageEmbedding"
  account_id                = data.aws_caller_identity.current.account_id
  region                    = data.aws_region.current.name
  file_uploaded_sns_dev_arn = module.ImageUpload.file_uploaded_sns_dev_arn
}

module "ImageClustering"{
  source                    = "./ImageClustering"
  account_id                = data.aws_caller_identity.current.account_id
  region                    = data.aws_region.current.name
  face_extracted_sns_dev_arn = module.ImageEmbedding.face_extracted_sns_dev_arn
}