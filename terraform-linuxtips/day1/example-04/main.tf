
terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region  = "us-east-1"
}

provider "aws" {
  alias   = "aws_west"
  region  = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "aws-s3-study-tfstates"
    key    = "example04.tfstate"
    region = "us-east-1"
  }
} 
