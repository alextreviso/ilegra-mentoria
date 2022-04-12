resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidrs)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block        = var.private_subnets_cidrs[count.index]

  tags = {
    Name    = "sub-private-${var.vpc_name}-${element(split("-", element(data.aws_availability_zones.available.names, count.index)),2)}"
    env     = var.env
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = var.public_subnets_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name    = "sub-public-${var.vpc_name}-${element(split("-", element(data.aws_availability_zones.available.names, count.index)),2)}"
    env     = var.env
  }
}