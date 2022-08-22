output "file_uploaded_sns_dev_arn"{
    value = aws_sns_topic.file_uploaded_dev.arn
    }


output "file_uploaded_prd_url"{
    value = aws_api_gateway_deployment.image_upload_dev.invoke_url
}

output "file_uploaded_dev_url"{
    value = aws_api_gateway_deployment.image_upload_dev.invoke_url
}