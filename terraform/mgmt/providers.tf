terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "unleash-devops-home-exercise-tfstate"
    key            = "terraform/mgmt/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws_region

  default_tags {
  }
}
