terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Using local backend for simplicity.
  # For production, uncomment the S3 backend below:
  # backend "s3" {
  #   bucket         = "unleash-exercise-tfstate"
  #   key            = "ecs-fargate/terraform.tfstate"
  #   region         = "eu-north-1"
  #   dynamodb_table = "terraform-lock"
  #   encrypt        = true
  # }
}

provider "aws" {
  region  = var.aws_region
  profile = "emily-home-exercise"

  default_tags {
    tags = {
      Project   = var.project_name
      ManagedBy = "terraform"
    }
  }
}
