resource "aws_route_table" "public_routes" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name    = "rt-public-${var.vpc_name}"
    env     = var.env
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_route_table.public_routes.id
}

resource "aws_default_route_table" "private_routes" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name    = "rt-private-${var.vpc_name}"
    env     = var.env
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = aws_default_route_table.private_routes.id
}