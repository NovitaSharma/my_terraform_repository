provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "novita-terraform-state-bucket"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}