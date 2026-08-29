globals "terraform" "providers" "aws" {
  enabled = true
  source  = "hashicorp/aws"
  version = "~> 6.0"
  config = {
    allowed_account_ids = [global.accounts[global.account_name].account_id]
    region              = global.region_name
    profile = tm_try(
      global.aws_config_profile,
      terramate.stack.path.basename,
    )
  }
}
