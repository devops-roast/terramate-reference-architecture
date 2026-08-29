stack {
  name        = "production-multi-region-object-storage"
  description = "Sample buckets routed through regional and cross-account providers"
  id          = "1ab29e6b-3031-4ee7-95ed-a00c0645f106"
  tags        = ["aws", "production", "multi-region", "storage"]
  after       = ["../network"]
}

globals "terraform" "providers" "aws.secondary" {
  enabled              = true
  default_tags_enabled = false
  config = {
    allowed_account_ids = [global.accounts[global.account_name].account_id]
    profile             = global.aws_config_profile
    region              = global.secondary_region
  }
}

globals "terraform" "providers" "aws.audit" {
  enabled              = true
  default_tags_enabled = false
  config = {
    allowed_account_ids = [global.accounts.audit.account_id]
    profile             = "example-audit"
    region              = "eu-west-1"
  }
}

globals "terraform" "providers" "random" {
  enabled = true
  source  = "hashicorp/random"
  version = "~> 3.0"
  config  = {}
}

globals "terraform" "providers" "time" {
  enabled = true
  source  = "hashicorp/time"
  version = "~> 0.13"
  config  = {}
}
