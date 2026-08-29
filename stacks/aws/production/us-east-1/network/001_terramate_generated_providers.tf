// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  allowed_account_ids = [
    "222222222222",
  ]
  profile = "example-production"
  region  = "us-east-1"
  default_tags {
    tags = {
      Application = "production-us-east-1-network"
      Environment = "production"
      ManagedBy   = "Terraform"
      Repository  = "terramate-reference-architecture"
      StackId     = "3b7504ff-6840-497b-8d9b-c9a07729c25c"
    }
  }
}
