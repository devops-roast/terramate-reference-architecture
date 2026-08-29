globals {
  accounts = {
    sandbox = {
      account_id = "111111111111"
    }
    production = {
      account_id = "222222222222"
    }
    audit = {
      account_id = "333333333333"
    }
  }

  regions_to_short = {
    "eu-west-1" = "euw1"
    "us-east-1" = "use1"
  }
}

generate_hcl "000_terramate_generated_terraform.tf" {
  lets {
    account_name = tm_try(global.account_name, terramate.stack.path.basename)

    account_id = tm_try(
      global.account_id,
      global.accounts[let.account_name].account_id,
    )

    profile = tm_try(global.aws_config_profile, let.account_name)

    account_alias = tm_try(global.accounts[let.account_name].account_alias, "")

    short_region = global.regions_to_short[global.region_name]

    bucket = tm_format(
      "tf-state%s-%s-%s",
      tm_ternary(let.account_alias != "", "-${let.account_alias}", ""),
      let.short_region,
      let.account_id,
    )

    dynamodb_table = tm_format(
      "tf-state-lock%s-%s",
      tm_ternary(let.account_alias != "", "-${let.account_alias}", ""),
      let.short_region,
    )
  }

  content {
    terraform {
      required_version = global.terraform_version

      backend "s3" {
        region         = global.region_name
        bucket         = let.bucket
        key            = "terraform/stacks/by-id/${terramate.stack.id}/terraform.tfstate"
        encrypt        = true
        dynamodb_table = let.dynamodb_table
        profile        = let.profile
      }
    }
  }
}
