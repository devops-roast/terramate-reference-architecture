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
  region  = "eu-west-1"
  default_tags {
    tags = {
      Application = "sandbox-eu-west-1-network"
      Environment = "sandbox"
      ManagedBy   = "Terraform"
      Repository  = "terramate-reference-architecture"
      StackId     = "5164c444-81a8-4c83-96b5-c6a7bea8a513"
    }
  }
}
