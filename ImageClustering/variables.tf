#################################################################
############################ BASE ###############################
#################################################################

variable "image_clustering_proj" {
  description = "Image upload project name"
  type        = string
  default     = "image_clustering"
}

variable "account_id"{
  description = "Account Id used to terraform"
  type        = string
}

variable "region"{
  description = "Account default region used to terraform"
  type        = string
}


variable face_extracted_sns_dev_arn{
    description = "File uploaded SNS arn that triggers the lambda"
    type        = string
}


#################################################################
############################ ECR ################################
#################################################################

variable "image_clustering_ecr_force_delete" {
    description = "Image upload ecr force delete from terraform destroy" 
    type        = string
    default     = true
}


variable "image_clustering_ecr_repository_mutability"{
  description = "Face clustering ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
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


#################################################################
############################ LAMBDA #############################
#################################################################

variable "lambda_timeout" {
    description = "Lambda clustering timeout" 
    type        = number
    default     = 20
}

variable "lambda_memory_size" {
    description = "Lambda clustering timeout" 
    type        = number
    default     = 512
}
