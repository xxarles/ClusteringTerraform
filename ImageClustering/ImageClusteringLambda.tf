

resource "aws_lambda_function" "image_clustering_dev" {
  function_name = "${var.image_clustering_proj}_dev"

  package_type = "Image"
  image_uri = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.image_clustering_proj}_dev:latest"
  
  role = "${aws_iam_role.iam_role_image_clustering.arn}"
  environment {
    variables = {
      ENV = "dev"
    }
  }
  timeout     = var.lambda_timeout
  memory_size = var.lambda_memory_size
  depends_on  = [aws_ecr_repository.image-clustering-dev]
}




resource "aws_iam_role" "iam_role_image_clustering" {
  name               = "iam_role_image_clustering"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_base_policy.json}"
}


resource "aws_iam_role_policy" "image_clustering_policy_dev" {
  name   = "${var.image_clustering_proj}_lambda_role_policy"
  role   = "${aws_iam_role.iam_role_image_clustering.id}"
  policy = "${data.aws_iam_policy_document.image_clustering_dev.json}"
}

data "aws_iam_policy_document" "image_clustering_dev" {

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

resource "aws_lambda_permission" "lambda_clustering_allow_sns" {
    statement_id = "AllowExecutionFromSNS"
    action = "lambda:InvokeFunction"
    principal = "sns.amazonaws.com"
    function_name = aws_lambda_function.image_clustering_dev.function_name
    source_arn = var.face_extracted_sns_dev_arn
}


resource "aws_sns_topic_subscription" "face_extracted_clustering_target" {
  topic_arn = var.face_extracted_sns_dev_arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.image_clustering_dev.arn
}
