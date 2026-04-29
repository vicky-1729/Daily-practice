terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    # configuration based on the env i will provide that why i am keeping empty
    
    bucket         = "vs-terraform-files"
    key            = "workspace-infra"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile  = true 
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}