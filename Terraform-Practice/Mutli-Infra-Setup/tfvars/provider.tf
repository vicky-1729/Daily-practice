terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    # configuration based on the env i will provide that why i am keeping empty
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}