

resource "aws_lambda_function" "image_embedding_dev" {
  function_name = "${var.image_embedding_proj}_dev"

  package_type = "Image"
  image_uri = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.image_embedding_proj}_dev:latest"
  
  role = "${aws_iam_role.iam_role_image_embedding.arn}"
  environment {
    variables = {
      ENV = "dev"
    }
  }

  depends_on = [aws_ecr_repository.image-embedding-dev]
}




resource "aws_iam_role" "iam_role_image_embedding" {
  name               = "iam_role_image_embedding"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_base_policy.json}"
}


resource "aws_iam_role_policy" "image_embedding_policy_dev" {
  name   = "${var.image_embedding_proj}_lambda_role_policy"
  role   = "${aws_iam_role.iam_role_image_embedding.id}"
  policy = "${data.aws_iam_policy_document.image_embedding_dev.json}"
}

data "aws_iam_policy_document" "image_embedding_dev" {

  statement {
    effect = "Allow"

    actions = [
      "lambda-object:*",
      "lambda:*",
      "logs:*",
      "s3:*",
      "SNS:*",
      "dynamodb:*",
    ]

    resources = ["*"]

  }

}

resource "aws_lambda_permission" "lambda_embedding_allow_sns" {
    statement_id = "AllowExecutionFromSNS"
    action = "lambda:InvokeFunction"
    principal = "sns.amazonaws.com"
    function_name = aws_lambda_function.image_embedding_dev.function_name
    source_arn = var.file_uploaded_sns_dev_arn
}


resource "aws_sns_topic_subscription" "file_uploaded_embedding_target" {
  topic_arn = var.file_uploaded_sns_dev_arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.image_embedding_dev.arn
}
