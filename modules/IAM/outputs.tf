// to define the IAM role arn.

output "iam_role_arn" {
  value = "${aws_iam_role.api_lambda_role}"
}