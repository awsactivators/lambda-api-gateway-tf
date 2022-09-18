// The execution ARN to be used in lambda_permission’s source arn when allowing API Gateway to invoke a Lambda function.

output "api_arn" {
  value = "${aws_api_gateway_deployment.main_api_gateway_deployment.execution_arn}"
}