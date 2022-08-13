
resource "aws_api_gateway_rest_api" "image_upload_dev" {
  name        = "image-upload-dev"
  description = "Image Upload Dev"

  endpoint_configuration {
    types            = ["PRIVATE"]
  }
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
  authorization = "NONE"
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
  authorization = "NONE"
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
