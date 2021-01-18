provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "aws-s3-study-tfstates"
    key    = "example05.tfstate"
    region = "us-east-1"
  }
} 
