terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
  

  backend "s3" {
    bucket = "vs-terraform-files"
    key    = "terraform-stfile-vs"
    region = "us-east-1"
    dynamodb_table = "vs-terraform-lock"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}