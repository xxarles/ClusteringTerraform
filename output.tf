output "image_upload_dev_url" {
  value = "${module.ImageUpload.file_uploaded_dev_url}"
}

output "file_uplaod_sns_arn_dev" {
  value = "${module.ImageUpload.file_uploaded_sns_dev_arn}"
}

# output "image_upload_prd_url" {
#   value = "${module.ImageUpload.file_uploaded_prd_url}"
# }

output "user_pool_id" {
  description = "name of the user pool"
  value       = module.SharedResources.user_pool_id
}


output "client_id" {
  description = "The ids of the user pool clients"
  value       = module.SharedResources.client_id
}

output "client_secret" {
  description = " The client secrets of the user pool clients"
  value       = module.SharedResources.client_id
  sensitive   = true
}