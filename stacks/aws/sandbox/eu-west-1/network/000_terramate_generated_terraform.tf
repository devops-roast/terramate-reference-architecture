// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.10, < 2.0"
  backend "s3" {
    bucket         = "tf-state-euw1-111111111111"
    dynamodb_table = "tf-state-lock-euw1"
    encrypt        = true
    key            = "terraform/stacks/by-id/5164c444-81a8-4c83-96b5-c6a7bea8a513/terraform.tfstate"
    profile        = "example-sandbox"
    region         = "eu-west-1"
  }
}
