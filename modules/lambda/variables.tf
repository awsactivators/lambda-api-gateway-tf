variable "function_name" {
  type = string
  default = "api-main-lambda"
}

variable "lambda_arn" {
  type = string
}

variable "iam_role_arn" {
  type = string
}