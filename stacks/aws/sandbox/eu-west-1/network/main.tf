module "network" {
  source = "../../../../../modules/dummy-network"

  name               = "sandbox-eu-west-1"
  cidr_block         = "10.10.0.0/16"
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  tags               = local.common_tags
}

output "vpc_id" {
  value = module.network.vpc_id
}
