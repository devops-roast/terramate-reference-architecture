generate_hcl "001_terramate_generated_providers.tf" {
  lets {
    aws_provider_default_tags = tm_merge(
      tm_try(global.aws_extra_default_tags, {}),
      {
        Application = tm_try(global.application, terramate.stack.name)
        Environment = tm_try(global.environment, "unknown")
        ManagedBy   = "Terraform"
        Repository  = "terramate-reference-architecture"
        StackId     = terramate.stack.id
      },
    )

    required_providers = { for k, v in tm_try(global.terraform.providers, {}) :
      k => {
        source  = v.source
        version = v.version
      }
      if tm_alltrue([
        tm_try(v.enabled, true),
        tm_length(tm_split(".", k)) == 1,
      ])
    }

    providers = { for k, v in tm_try(global.terraform.providers, {}) :
      k => {
        default_tags_enabled = tm_try(v.default_tags_enabled, true)
        config               = tm_try(v.config, {})
        config_partial       = tm_try(v.config_partial, {})
      }
      if tm_alltrue([
        tm_try(v.enabled, true),
        tm_length(tm_split(".", k)) == 1,
        tm_can(v.config) || tm_can(v.config_partial),
      ])
    }

    providers_aliases = { for k, v in tm_try(global.terraform.providers, {}) :
      k => {
        default_tags_enabled = tm_try(v.default_tags_enabled, true)
        config               = tm_try(v.config, {})
        config_partial       = tm_try(v.config_partial, {})
      }
      if tm_alltrue([
        tm_try(v.enabled, true),
        tm_length(tm_split(".", k)) == 2,
        tm_can(v.config) || tm_can(v.config_partial),
      ])
    }
  }

  content {
    terraform {
      tm_dynamic "required_providers" {
        attributes = let.required_providers
      }
    }

    tm_dynamic "provider" {
      for_each = let.providers
      labels   = [provider.key]
      attributes = tm_merge(
        tm_try(provider.value.config, {}),
        tm_try({
          for k, v in provider.value.config_partial :
          k => tm_hcl_expression(v)
        }, {}),
      )

      content {
        tm_dynamic "default_tags" {
          condition = tm_alltrue([
            provider.key == "aws",
            tm_try(provider.value.default_tags_enabled, true),
          ])
          content {
            tags = let.aws_provider_default_tags
          }
        }
      }
    }

    tm_dynamic "provider" {
      for_each = let.providers_aliases
      labels   = [tm_split(".", provider.key)[0]]
      attributes = tm_merge(
        tm_try(provider.value.config, {}),
        tm_try({
          for k, v in provider.value.config_partial :
          k => tm_hcl_expression(v)
        }, {}),
      )

      content {
        alias = tm_split(".", provider.key)[1]

        tm_dynamic "default_tags" {
          condition = tm_alltrue([
            tm_split(".", provider.key)[0] == "aws",
            tm_try(provider.value.default_tags_enabled, true),
          ])
          content {
            tags = let.aws_provider_default_tags
          }
        }
      }
    }
  }
}
