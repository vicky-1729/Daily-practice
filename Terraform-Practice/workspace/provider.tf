terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
  backend "s3" {
    bucket       = "vs-terraform-files"
    key          = "vs-roboshop"
    region       = "us-east-1"
    use_lockfile   = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}