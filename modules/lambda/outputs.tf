// Invoke arn – The arn to invoke the lambda function.

output "lambda_arn" {
  value = aws_lambda_function.api_main_lambda.invoke_arn
}