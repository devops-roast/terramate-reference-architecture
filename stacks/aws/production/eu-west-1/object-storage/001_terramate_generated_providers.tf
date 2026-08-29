// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
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
      Application = "production-multi-region-object-storage"
      Environment = "production"
      ManagedBy   = "Terraform"
      Repository  = "terramate-reference-architecture"
      StackId     = "1ab29e6b-3031-4ee7-95ed-a00c0645f106"
    }
  }
}
provider "random" {
}
provider "time" {
}
provider "aws" {
  allowed_account_ids = [
    "333333333333",
  ]
  profile = "example-audit"
  region  = "eu-west-1"
  alias   = "audit"
}
provider "aws" {
  allowed_account_ids = [
    "222222222222",
  ]
  profile = "example-production"
  region  = "us-east-1"
  alias   = "secondary"
}
