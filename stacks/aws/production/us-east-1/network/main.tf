module "network" {
  source = "../../../../../modules/dummy-network"

  name               = "production-us-east-1"
  cidr_block         = "10.21.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  tags               = local.common_tags
}

output "vpc_id" {
  value = module.network.vpc_id
}
