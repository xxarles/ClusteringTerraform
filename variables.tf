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

#Dynamo table definitions

variable "clustering_dynamo_table_name" {
  description = "Clustering dynamo table name"
  type        = string
  default     = "clustering_status"
}

variable "clustering_dynamo_table_billing_mode" {
  description = "Clustering dynamo table billing_mode"
  type        = string
  default     = "PROVISIONED"
}

variable "clustering_dynamo_table_read_capacity" {
  description = "Clustering dynamo table read_capacity"
  type        = number
  default     = 20
}

variable "clustering_dynamo_table_write_capacity" {
  description = "Clustering dynamo table write_capacity"
  type        = number
  default     = 20
}

variable "clustering_dynamo_table_hash_key" {
  description = "Clustering dynamo table hash_key"
  type        = string
  default     = "user_id"
}

variable "clustering_dynamo_table_range_key" {
  description = "Clustering dynamo table range_key"
  type        = string
  default     = "folder_name"
}



variable "face_embedding_table_name" {
  description = "Clustering dynamo table name"
  type        = string
  default     = "face_embeddings_table"
}

variable "face_embedding_table_billing_mode" {
  description = "Clustering dynamo table billing_mode"
  type        = string
  default     = "PROVISIONED"
}

variable "face_embedding_table_read_capacity" {
  description = "Clustering dynamo table read_capacity"
  type        = number
  default     = 20
}

variable "face_embedding_table_write_capacity" {
  description = "Clustering dynamo table write_capacity"
  type        = number
  default     = 20
}

variable "face_embedding_table_hash_key" {
  description = "Clustering dynamo table hash_key"
  type        = string
  default     = "filepath"
}

variable "face_embedding_table_range_key" {
  description = "Clustering dynamo table range_key"
  type        = string
  default     = "face_rectangle"
}

variable "face_embedding_table_hash_key_type" {
  description = "Clustering dynamo table hash_key type"
  type        = string
  default     = "S"
}

variable "face_embedding_table_range_key_type" {
  description = "Clustering dynamo table range_key type"
  type        = string
  default     = "S"
}

###############################################################
###############################################################

#ECR definitions

variable "clustering_ecr_repository_mutability"{
  description = "Clustering ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}

variable "face_embedding_ecr_repository_mutability"{
  description = "Face embedding ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}

variable "iamge_upload_ecr_repository_mutability"{
  description = "Image upload ECR tag mutability config"
  type        = string
  default     = "MUTABLE"
}


#################################################################
#################################################################


#Lambda definitions
#TODO

#################################################################
#################################################################

#SNS definitions

variable "file_uploaded_sns_minDelayTarget"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 20
}

variable "file_uploaded_sns_maxDelayTarget"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 20
}

variable "file_uploaded_sns_numRetries"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 3
}

variable "file_uploaded_sns_numMaxDelayRetries"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 0
}

variable "file_uploaded_sns_numNoDelayRetries"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 0
}

variable "file_uploaded_sns_numMinDelayRetries"{
  description = "Clustering ECR tag mutability config"
  type        = number
  default     = 0
}

variable "file_uploaded_sns_backoffFunction"{
  description = "Image upload ECR tag mutability config"
  type        = string
  default     = "linear"
}
