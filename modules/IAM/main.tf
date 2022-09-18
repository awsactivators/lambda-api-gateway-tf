
// IAM Role that assume the pollicy document

resource "aws_iam_role" "api_lambda_role" {
  name = var.iam_role_name
  assume_role_policy = <<EOF
  {
    "Version":  "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""     
       }
    ]
  }
  EOF
}

// aws_lambda_permission – Allowing API Gateway and  AWS Lambda to access  one other.

// aws_iam_role_policy _attachment for vpc_access _execution – to access vpc with AWS Lambda.

resource "aws_lambda_permission" "api_lambda_permission" {
    statement_id = "AllowAPIGatewayInvoke"
    action = "lambda:InvokeFunction"
    function_name = "api-lambda"
    principal = "apigateway.amazonaws.com"
    source_arn = "${var.api_arn}/*/*"
}

resource "aws_iam_role_policy_attachment" "api_lambda_execution" {
    role = aws_iam_role.api_lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "api_lambda_vpc_access_exec" {
    role = aws_iam_role.api_lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

