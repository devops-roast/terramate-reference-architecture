// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.10, < 2.0"
  backend "s3" {
    bucket         = "tf-state-euw1-222222222222"
    dynamodb_table = "tf-state-lock-euw1"
    encrypt        = true
    key            = "terraform/stacks/by-id/1ab29e6b-3031-4ee7-95ed-a00c0645f106/terraform.tfstate"
    profile        = "example-production"
    region         = "eu-west-1"
  }
}
