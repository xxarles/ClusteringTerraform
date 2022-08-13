

resource "aws_lambda_function" "image_embedding_dev" {
  function_name = "${var.image_embedding_proj}-dev"

  package_type = "Image"
  image_uri = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/image-embedding-dev:latest"
  
  role = "${aws_iam_role.iam_role_image_embedding.arn}"
  environment {
    variables = {
      ENV = "dev"
    }
  }
}




resource "aws_iam_role" "iam_role_image_embedding" {
  name               = "iam_role_image_embedding"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_base_policy.json}"
}


resource "aws_iam_role_policy" "image_embedding_policy_dev" {
  name   = "backend-lambda-role-policy"
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
    function_name = aws_lambda_function.image_embedding_dev.function_name
    principal = "sns.amazonaws.com"
    source_arn = aws_sns_topic.file_uploaded_dev.arn
}


