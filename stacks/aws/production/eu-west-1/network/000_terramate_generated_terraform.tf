// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.10, < 2.0"
  backend "s3" {
    bucket         = "tf-state-euw1-222222222222"
    dynamodb_table = "tf-state-lock-euw1"
    encrypt        = true
    key            = "terraform/stacks/by-id/c4218caf-ef6f-4567-bcd1-6cf82a8ebe57/terraform.tfstate"
    profile        = "example-production"
    region         = "eu-west-1"
  }
}
