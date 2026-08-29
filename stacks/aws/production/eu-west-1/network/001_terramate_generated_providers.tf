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
  region  = "eu-west-1"
  default_tags {
    tags = {
      Application = "production-eu-west-1-network"
      Environment = "production"
      ManagedBy   = "Terraform"
      Repository  = "terramate-reference-architecture"
      StackId     = "c4218caf-ef6f-4567-bcd1-6cf82a8ebe57"
    }
  }
}
