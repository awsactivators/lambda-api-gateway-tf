# lambda-api-gateway-tf

In this project, I integrated AWS lambda with API Gateway to run our application which is written in python using terraform code. 

This lambda integration traces a path and HTTP method combination to a Lambda function. I configured the API Gateway to pass the content of the HTTP request as-is or to summarize the requested content in a document that includes all the information including headers, resource, path, and method.

Workflow of my Terraform code

- I created modules for the IAM role, Lambda function, API Gateway, and terraform-s3. Each module has its own main.tf, outputs.tf, and variable.tf. The lambda module had the python code and zip file.

- in the main directory had the main.tf where I called all the modules.

Main Tips

- Used environment variable to secure my aws credential via the terminal

- I created an IAM Role for the lambda function and API Gateway by indicating the assume role and lambda permission to the API Gateway by attaching the IAM role policy to the lambda execution

- I configured the Lambda function containing the function code where I set the runtime to Python3.8, and assigned the handler to the handler function defined in the python file.

- Next, I created the POST & OPTION method, integrated the method, and deployed it by creating the rest_api gateway. (The rest_API is a collection of resources and methods that are integrated with backend HTTP endpoints, Lambda functions, or other AWS services.)

- I made sure my .tfstate file is secured by storing it in an S3 bucket that is encrypted, versioning enabled and lifecycle prevent destroy checked to true, and DynamoDB for locking of the .tfstate file

- Initialized my working directory containing my terraform configuration files

- terraform plan to check the resources that I will be provisioning

- terraform apply to deploy the build-up infrastructure.
