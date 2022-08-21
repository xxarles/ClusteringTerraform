#################################################################
############################BASE DEFS############################
#################################################################


variable "image_upload_proj" {
  description = "Image upload project name"
  type        = string
  default     = "image-upload"
}

variable "account_id"{
  description = "Account Id used to terraform"
  type        = string
}

variable "region"{
  description = "Account default region used to terraform"
  type        = string
}


#################################################################
############################ ECR ################################
#################################################################

variable "image_upload_ecr_repository_mutability"{
  description = "Image upload ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}

variable "image_upload_ecr_policy"{
  description = "Image upload ECR tag mutability config"
  type        = string
  default     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
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


#################################################################
############################ SNS ################################
#################################################################

variable "file_uploaded_sns_name" {
  description = "File uploaded sns base name"
  type        = string
  default     = "new-files-uploaded"
}


variable "sns_file_uploaded_delivery_policy"{
  description = "File Uploades SNS delivery policy"
  type        = string
  default     = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false
  }
}
EOF
}


#################################################################
####################### API GATEWAY ################################
#################################################################


