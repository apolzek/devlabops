terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "aws-s3-study-tfstates"
    key    = "example03.tfstate"
    region = "us-east-1"
  }
} 
