variable "iam_role_name" {
  description = "API Gateway name"
  type = string
  default = "API_lambda_role"
}

variable "api_arn" {
  type = string
  //default = "api_lambda_role"
}

variable "iam_role_arn" {
  type = string
  //default = "api_lambda_role"
}

variable "lambda_arn" {
  type = string
}