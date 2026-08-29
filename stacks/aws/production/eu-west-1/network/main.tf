module "network" {
  source = "../../../../../modules/dummy-network"

  name               = "production-eu-west-1"
  cidr_block         = "10.20.0.0/16"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  tags               = local.common_tags
}

output "vpc_id" {
  value = module.network.vpc_id
}
