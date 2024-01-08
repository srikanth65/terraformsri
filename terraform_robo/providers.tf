terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-tfstate-sri"
    key            = "terraform_robo"
    region         = "us-east-1"
    dynamodb_table = "terraform_robo"
  }
}

provider "aws" {
  region = "us-east-1"
}


