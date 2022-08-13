terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }

  required_version = ">= 0.14.9"
}


data "aws_region" "current" {}

data "aws_caller_identity" "current" {}


provider "aws" {
  region = "us-east-1"
}

data "aws_iam_policy_document" "lambda_base_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

terraform {
  backend "s3" {
    bucket = "img-clustr-terraform"
    key    = "base_path/terraform_state"
    region = "us-east-1"
  }
}