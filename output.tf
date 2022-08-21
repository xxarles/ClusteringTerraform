output "image_upload_dev_url" {
  value = "${module.ImageUpload.file_uploaded_dev_url}"
}

output "file_uplaod_sns_arn_dev" {
  value = "${module.ImageUpload.file_uploaded_sns_dev_arn}"
}

# output "image_upload_prd_url" {
#   value = "${module.ImageUpload.file_uploaded_prd_url}"
# }
