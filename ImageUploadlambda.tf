

resource "aws_lambda_function" "image_upload_dev" {
  function_name = "image-upload-dev"

  package_type = "Image"
  image_uri = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/image-upload-dev:latest"
  
  role = "${aws_iam_role.iam_role_image_upload.arn}"
  environment {
    variables = {
      ENV = "dev"
    }
  }
}



resource "aws_lambda_permission" "image_upload_dev_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.image_upload_dev.function_name}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_rest_api.image_upload_dev.execution_arn}/*/*"
}



data "aws_iam_policy_document" "lambda_base_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_role_image_upload" {
  name               = "iam_role_image_upload"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_base_policy.json}"
}


resource "aws_iam_role_policy" "image_upload_policy_dev" {
  name   = "backend-lambda-role-policy"
  role   = "${aws_iam_role.iam_role_image_upload.id}"
  policy = "${data.aws_iam_policy_document.image_upload_dev.json}"
}

data "aws_iam_policy_document" "image_upload_dev" {

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


