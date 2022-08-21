resource "aws_sns_topic" "file_uploaded_dev" {
  name            = "${var.file_uploaded_sns_name}-dev"
  delivery_policy = var.sns_file_uploaded_delivery_policy
}

#resource "aws_sns_topic_subscription" "file_uploaded_embedding_target" {
#  topic_arn = aws_sns_topic.file_uploaded_dev.arn
#  protocol  = "lambda"
#  endpoint  = aws_lambda_function.image_embedding_dev.arn
#}

