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
