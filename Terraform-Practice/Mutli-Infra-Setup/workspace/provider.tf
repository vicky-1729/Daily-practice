terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    bucket         = "vs-terraform-statefile"
    key            = "terraform-workspace"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true # Enables native S3 locking
   
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}