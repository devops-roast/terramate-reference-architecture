generate_hcl "009_terramate_generated_context.tf" {
  content {
    locals {
      common_tags = {
        Account     = global.account_name
        Environment = global.environment
        ManagedBy   = "Terraform"
        Region      = global.region_name
        Repository  = "terramate-reference-architecture"
        Stack       = terramate.stack.name
        StackId     = terramate.stack.id
      }
    }
  }
}
