#####################################################
############### BASE DEFS ###########################
#####################################################

variable "proj_name"{
    description = "Logging acl for shared s3"
    type        = string
    default     = "img-clstr"
}


variable "easy_terraform_destroy"{
    description = "Can we shut down and destroy data"
    type        = bool
    default     = true
}

variable "account_id"{
  description = "Account Id used to terraform"
  type        = string
}

variable "region"{
  description = "Account default region used to terraform"
  type        = string
}



#####################################################
##################### S3 ############################
#####################################################



variable "s3_logging_acl"{
    description = "Logging acl for shared s3"
    type        = string
    default     = "log-delivery-write"
}

variable "log_bucket_prefix"{
    description = "Prefix to store logs"
    default     = "log/"
    type        = string
}

#####################################################
############### DYNABMO DB ##########################
#####################################################

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

variable "clustering_dynamo_table_hash_key_type" {
  description = "Clustering dynamo table hash_key type"
  type        = string
  default     = "S"
}

variable "clustering_dynamo_table_range_key_type" {
  description = "Clustering dynamo table range_key type"
  type        = string
  default     = "S"
}



variable "face_embedding_table_name" {
  description = "Face embedding dynamo table name"
  type        = string
  default     = "face_embeddings_table"
}

variable "face_embedding_table_billing_mode" {
  description = "Face embedding dynamo table billing_mode"
  type        = string
  default     = "PROVISIONED"
}

variable "face_embedding_table_read_capacity" {
  description = "Face embedding dynamo table read_capacity"
  type        = number
  default     = 20
}

variable "face_embedding_table_write_capacity" {
  description = "Face embedding dynamo table write_capacity"
  type        = number
  default     = 20
}

variable "face_embedding_table_hash_key" {
  description = "Face embedding dynamo table hash_key"
  type        = string
  default     = "filepath"
}

variable "face_embedding_table_range_key" {
  description = "Face embedding dynamo table range_key"
  type        = string
  default     = "face_rectangle"
}

variable "face_embedding_table_hash_key_type" {
  description = "Face embedding dynamo table hash_key type"
  type        = string
  default     = "S"
}

variable "face_embedding_table_range_key_type" {
  description = "Face embedding dynamo table range_key type"
  type        = string
  default     = "S"
}

#################################################################
########################### COGINITO ############################
#################################################################

variable "callback_urls"{ 
  default     = ["http://localhost:3000"]
  description = "URL for setting up cognito client" 
  type        = list(string)
}
variable "logout_urls"{ 
  default     = ["http://localhost:3000"]
  description = "URL for setting up cognito client" 
  type        = list(string)
}

variable "password_minimum_length" {
  type        = number
  description = "(Optional) The minimum length of the password policy that you have set."
  default     = 8
}

variable "password_require_lowercase" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one lowercase letter in their password."
  default     = true
}

variable "password_require_numbers" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one number in their password."
  default     = true
}

variable "password_require_symbols" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one symbol in their password."
  default     = true
}

variable "password_require_uppercase" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one uppercase letter in their password."
  default     = true
}

variable "temporary_password_validity_days" {
  type        = number
  description = "(Optional) In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator."
  default     = 1
}


variable "invite_email_subject" {
  type        = string
  description = "(Optional) The subject for email messages."
  default     = "Your new account."
}

variable "invite_email_message" {
  type        = string
  description = "(Optional) The message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  default     = "Your username is {username} and your temporary password is '{####}'."
}

variable "auto_verified_attributes" {
  type        = set(string)
  description = "(Optional) The attributes to be auto-verified. Possible values: 'email', 'phone_number'."
  default = [
    "email"
  ]
}

variable "default_email_option" {
  type        = string
  description = "(Optional) The default email option. Must be either `CONFIRM_WITH_CODE` or `CONFIRM_WITH_LINK`."
  default     = "CONFIRM_WITH_CODE"
}

variable "email_message" {
  type        = string
  description = "(Optional) The email message template. Must contain the {####} placeholder."
  default     = "Your verification code is {####}."
}

variable "email_message_by_link" {
  type        = string
  description = "(Optional) The email message template for sending a confirmation link to the user, it must contain the {##Any Text##} placeholder."
  default     = "Please click the link below to verify your email address. {##Verify Email##}."
}

variable "email_subject" {
  type        = string
  description = "(Optional) The subject line for the email message template."
  default     = "Your Verification Code"
}

variable "email_subject_by_link" {
  type        = string
  description = "(Optional) The subject line for the email message template for sending a confirmation link to the user."
  default     = "Your Verification Link"
}



variable "schema_attribute_data_type" {
    default = "String"
    type = string
    description = "Cognito schema def" 
}
variable "schema_name" {
    default = "email"
    type = string
    description = "Cognito schema def" 
}
variable "schema_developer_only_attribute" {
    default = false
    type = bool
    description = "Cognito schema def" 
}
variable "schema_mutable" {
    default = true
    type = bool
    description = "Cognito schema def" 
}
variable "schema_required" {
    default = true
    type = bool
    description = "Cognito schema def" 
}

variable "schema_max_length"{
    default = 256
    type    = number
    description = "Schema definition"
}
variable "schema_min_length"{
    default = 1
    type    = number
    description = "Schema definition"
}



variable client_generate_secret{
   default      = false
   type         = bool
   description  = "Client definition" 

}
    
variable client_refresh_token_validity{
   default     = 90
   type        = number
   description = "Client definition" 

}
    
variable client_prevent_user_existence_errors{
   default     = "ENABLED"
   type        = string
   description = "Client definition" 

}
    
variable client_explicit_auth_flows{
    default = [
        "ALLOW_REFRESH_TOKEN_AUTH",
        "ALLOW_USER_PASSWORD_AUTH",
        "ALLOW_ADMIN_USER_PASSWORD_AUTH"
    ]
    type        = list(string)
    description = "Client definition" 
}

variable "allowed_oauth_flows"{
  default      = ["code", "implicit"]
  description  = "Cognito definitions"
  type         = list(string)
}

variable "allowed_oauth_scopes"{
  default      = [
    "aws.cognito.signin.user.admin",
    "email",
    "openid",
    "profile",
  ]
  description  = "Cognito definitions"
  type         = list(string)
}


variable "allowed_oauth_flows_user_pool_client"{
  default      = true
  description  = "Cognito definitions"
  type         = bool
}
    

variable "oauth_client_id"{
  description = "Client Id for google oauth should come from env variable TF_VAR_OAUTH_CLIENT_ID"
  type        = string
}

variable "oauth_client_secret"{
  description = "Client Id for google oauth should come from env variable TF_VAR_OAUTH_CLIENT_SECRET"
  type        = string
}