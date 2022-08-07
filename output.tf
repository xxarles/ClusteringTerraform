output "image_upload_dev" {
  value = "${aws_api_gateway_deployment.image_upload_dev.invoke_url}"
}

output "file_uplaod_sns_arn_dev" {
  value = "${aws_sns_topic.file_uploaded_dev.arn}"
}

# output "image_upload_prd" {
#   value = "${aws_api_gateway_deployment.image_upload_prd.invoke_url}"
# }
