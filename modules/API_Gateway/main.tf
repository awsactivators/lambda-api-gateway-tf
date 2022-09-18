
// defines a name for the API Gateway and sets its protocol to HTTP method.

resource "aws_api_gateway_rest_api" "main_api_gateway" {
  name = var.api_name
}

// Root Methods

resource "aws_api_gateway_method" "post_form" {
  rest_api_id = aws_api_gateway_rest_api.main_api_gateway.id
  resource_id = aws_api_gateway_rest_api.main_api_gateway.root_resource_id
  http_method = "POST"
  authorization = "NONE"
}

//configures the API Gateway to use the Lambda function

resource "aws_api_gateway_integration" "main_api_gateway_integrationrootpost" {
  rest_api_id = aws_api_gateway_rest_api.main_api_gateway.id
  resource_id = aws_api_gateway_method.post_form.resource_id
  http_method = aws_api_gateway_method.post_form.http_method

  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${var.lambda_arn}"
}

resource "aws_api_gateway_method" "options_form" {
  rest_api_id = aws_api_gateway_rest_api.main_api_gateway.id //defines the ID of the associated REST API
  resource_id = aws_api_gateway_rest_api.main_api_gateway.root_resource_id //defines the REST API resource ID
  http_method = "OPTIONS" //the method which is calling the associated resource
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "main_api_gateway_integrationrootoptions" {
  rest_api_id = aws_api_gateway_rest_api.main_api_gateway.id
  resource_id = aws_api_gateway_method.options_form.resource_id
  http_method = aws_api_gateway_method.options_form.http_method

  integration_http_method = "OPTIONS"
  type = "AWS_PROXY"
  uri = "${var.lambda_arn}"
}

//The deployment can then be published to callable endpoints via the aws_api _gateway _stage resource.

resource "aws_api_gateway_deployment" "main_api_gateway_deployment" {
  depends_on = [aws_api_gateway_integration.main_api_gateway_integrationrootpost]
  rest_api_id = aws_api_gateway_rest_api.main_api_gateway.id
  stage_name = "stage-api" //defines the name of the stage
}