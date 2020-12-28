provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-apolzek-tfstates"
    key    = "terraform-apolzek.tfstate"
    region = "us-east-1"
  }
} 