#Base Configs

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

###############################################################
###############################################################

#Name definitions

variable "image_clustering_proj" {
  description = "Image clustering project name"
  type        = string
  default     = "img-clstr"
}

variable "image_upload_proj" {
  description = "Image upload project name"
  type        = string
  default     = "image-upload"
}

variable "image_embedding_proj" {
  description = "Image embedding project name"
  type        = string
  default     = "image-embedding"
}


###############################################################
###############################################################



###############################################################
###############################################################

#ECR definitions

variable "clustering_ecr_repository_mutability"{
  description = "file uploaded SNS config"
  type        = string
  default     = "MUTABLE"
}

variable "face_embedding_ecr_repository_mutability"{
  description = "Face embedding ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}

#################################################################
####################### OAUTH INFOS #############################
#################################################################

variable "OAUTH_CLIENT_ID"{
  description = "Client Id for google oauth should come from env variable TF_VAR_OAUTH_CLIENT_ID"
  type        = string
}

variable "OAUTH_CLIENT_SECRET"{
  description = "Client Id for google oauth should come from env variable TF_VAR_OAUTH_CLIENT_SECRET"
  type        = string
}