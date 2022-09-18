# store tfstate in s3 and locking information in DynamoDB

terraform {
  backend "s3" {
    encrypt = true
    bucket = "var.terraform-state-bucknet-names"
    region = "us-east-2"
    dynamodb_table = "dynamodb-terraform-state-lock"
    key = "terraform-state/terraform.tfstate"
  }
}


# terraform state file setup
# create an S3 bucket to store the state file in

resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "var.terraform-state-bucknet-names"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
	rule {
	apply_server_side_encryption_by_default {
		sse_algorithm = "AES256"
					}
		}
}

}

# create a DynamoDB table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "dynamodb-terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}








