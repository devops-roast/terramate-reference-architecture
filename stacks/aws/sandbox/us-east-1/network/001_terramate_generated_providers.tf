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
    "111111111111",
  ]
  profile = "example-sandbox"
  region  = "us-east-1"
  default_tags {
    tags = {
      Application = "sandbox-us-east-1-network"
      Environment = "sandbox"
      ManagedBy   = "Terraform"
      Repository  = "terramate-reference-architecture"
      StackId     = "40dffb71-ef12-473f-9ef0-210c84031695"
    }
  }
}
