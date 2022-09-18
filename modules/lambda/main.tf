
//  configure the Lambda function containing the function code

resource "aws_lambda_function" "api_main_lambda" {
  function_name = var.function_name
  filename = "${path.module}/main_lambda.zip"
  handler = "lambda-func.lambda_handler"
  runtime = "python3.8"
  role = "${var.iam_role_arn}"
  source_code_hash = data.archive_file.lambda-func.output_base64sha256

  vpc_config {
    subnet_ids = ["subnet-03f6b7b9f2efa21b3"]
    security_group_ids = [ "sg-0fb1892f134163d89" ]
  }
}

data "archive_file" "lambda-func" {
    type = "zip"
    source_dir = "${path.module}/lambda-func"
    output_path = "${path.module}/main_lambda.zip"
}