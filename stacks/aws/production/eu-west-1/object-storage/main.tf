resource "random_pet" "example_label" {
  length = 2
}

resource "time_static" "provisioned" {}

module "primary" {
  source = "../../../../../modules/dummy-object-store"

  providers = {
    aws = aws
  }

  bucket_name = "example-${local.common_tags.Account}-euw1-primary"
  tags = merge(local.common_tags, {
    DataRole = "primary"
  })
}

module "replica" {
  source = "../../../../../modules/dummy-object-store"

  providers = {
    aws = aws.secondary
  }

  bucket_name = "example-${local.common_tags.Account}-use1-replica"
  tags = merge(local.common_tags, {
    DataRole = "replica"
    Region   = "us-east-1"
  })
}

module "audit" {
  source = "../../../../../modules/dummy-object-store"

  providers = {
    aws = aws.audit
  }

  bucket_name = "example-333333333333-euw1-audit"
  tags = merge(local.common_tags, {
    Account  = "audit"
    DataRole = "audit"
  })
}

output "bucket_names" {
  value = {
    audit   = module.audit.bucket_name
    primary = module.primary.bucket_name
    replica = module.replica.bucket_name
  }
}

output "provisioned_at" {
  value = time_static.provisioned.rfc3339
}

output "example_random_label" {
  value = random_pet.example_label.id
}
