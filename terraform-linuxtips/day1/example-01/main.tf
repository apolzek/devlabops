
terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "aws-s3-study-tfstates"
    key    = "example01.tfstate"
    region = "us-east-1"
  }
} 

# Extra
resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-bucket-apolzek-terraform"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}