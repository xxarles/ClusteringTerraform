
resource "aws_api_gateway_rest_api" "image_upload_dev" {
  name        = "image-upload-dev"
  description = "Image Upload Dev"

  #endpoint_configuration {
  #  types            = ["PRIVATE"]
  #}
}

resource "aws_api_gateway_resource" "image_upload_proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  parent_id   = "${aws_api_gateway_rest_api.image_upload_dev.root_resource_id}"
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "image_upload_proxy" {
  rest_api_id   = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  resource_id   = "${aws_api_gateway_resource.image_upload_proxy.id}"
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.upload_lambda_api_authorizer.id

}

resource "aws_api_gateway_integration" "image_upload_dev_lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  resource_id = "${aws_api_gateway_method.image_upload_proxy.resource_id}"
  http_method = "${aws_api_gateway_method.image_upload_proxy.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.image_upload_dev.invoke_arn}"
}


resource "aws_api_gateway_method" "image_upload_proxy_root" {
  rest_api_id   = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  resource_id   = "${aws_api_gateway_rest_api.image_upload_dev.root_resource_id}"
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.upload_lambda_api_authorizer.id

}


resource "aws_api_gateway_integration" "image_upload_dev_lambda_root" {
  rest_api_id = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  resource_id = "${aws_api_gateway_method.image_upload_proxy_root.resource_id}"
  http_method = "${aws_api_gateway_method.image_upload_proxy_root.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.image_upload_dev.invoke_arn}"
}

resource "aws_api_gateway_deployment" "image_upload_dev" {
  depends_on = [
    "aws_api_gateway_integration.image_upload_dev_lambda",
    "aws_api_gateway_integration.image_upload_dev_lambda_root",
  ]

  rest_api_id = "${aws_api_gateway_rest_api.image_upload_dev.id}"
  stage_name  = "entry"

}

resource "aws_api_gateway_stage" "image_upload_dev" {
  deployment_id = aws_api_gateway_deployment.image_upload_dev.id
  rest_api_id   = aws_api_gateway_rest_api.image_upload_dev.id
  stage_name    = "dev"
}


resource "aws_api_gateway_usage_plan" "image_upload_dev" {
  name         = "Image Upload usage plan"
  description  = "my description"

  api_stages {
    api_id = aws_api_gateway_rest_api.image_upload_dev.id
    stage  = aws_api_gateway_stage.image_upload_dev.stage_name
  }

  quota_settings {
    limit  = 150
    offset = 2
    period = "WEEK"
  }

  throttle_settings {
    burst_limit = 5
    rate_limit  = 10
  }
}

resource "aws_api_gateway_authorizer" "upload_lambda_api_authorizer" {
  name                   = "ImageClustering_autorizer"
  type                   = "COGNITO_USER_POOLS"
  rest_api_id            = aws_api_gateway_rest_api.image_upload_dev.id
  provider_arns          = var.cognito_arn
}

