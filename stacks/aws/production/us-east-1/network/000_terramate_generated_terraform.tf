// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.10, < 2.0"
  backend "s3" {
    bucket         = "tf-state-use1-222222222222"
    dynamodb_table = "tf-state-lock-use1"
    encrypt        = true
    key            = "terraform/stacks/by-id/3b7504ff-6840-497b-8d9b-c9a07729c25c/terraform.tfstate"
    profile        = "example-production"
    region         = "us-east-1"
  }
}
