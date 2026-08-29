// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.10, < 2.0"
  backend "s3" {
    bucket         = "tf-state-use1-111111111111"
    dynamodb_table = "tf-state-lock-use1"
    encrypt        = true
    key            = "terraform/stacks/by-id/40dffb71-ef12-473f-9ef0-210c84031695/terraform.tfstate"
    profile        = "example-sandbox"
    region         = "us-east-1"
  }
}
