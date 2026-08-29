resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_subnet" "sample" {
  count = length(var.availability_zones)

  availability_zone       = var.availability_zones[count.index]
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.name}-${var.availability_zones[count.index]}"
  })
}
