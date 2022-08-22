variable "image_embedding_proj" {
  description = "Image upload project name"
  type        = string
  default     = "image_embedding"
}

variable "account_id"{
  description = "Account Id used to terraform"
  type        = string
}

variable "region"{
  description = "Account default region used to terraform"
  type        = string
}


variable file_uploaded_sns_dev_arn{
    description = "File uploaded SNS arn that triggers the lambda"
    type        = string
}

variable "image_embedding_ecr_repository_mutability"{
  description = "Face embedding ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}

variable "image_upload_ecr_force_delete" {
    description = "Image upload ecr force delete from terraform destroy" 
    type        = string
    default     = true
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


variable "image_embedding_ecr_force_delete" {
    description = "Image upload ecr force delete from terraform destroy" 
    type        = string
    default     = true
}