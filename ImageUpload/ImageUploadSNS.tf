resource "aws_sns_topic" "file_uploaded_dev" {
  name            = "${var.file_uploaded_sns_name}-dev"
  delivery_policy = var.sns_file_uploaded_delivery_policy
}


