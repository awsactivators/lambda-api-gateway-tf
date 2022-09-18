// calling all the modules

module "IAM" {
  source = "./modules/IAM"
  api_arn = "${module.API_Gateway.api_arn}"
  iam_role_arn = "${module.IAM.iam_role_arn}"
  lambda_arn = "${module.lambda.lambda_arn}"
}

module "lambda" {
  source = "./modules/lambda"
  lambda_arn = "${module.lambda.lambda_arn}"
  iam_role_arn = "${module.IAM.iam_role_arn}"
}

module "API_Gateway" {
  source = "./modules/API_Gateway"
  lambda_arn = "${module.lambda.lambda_arn}"
}

module "terraform-s3" {
  source = "./modules/terraform-s3"
}





