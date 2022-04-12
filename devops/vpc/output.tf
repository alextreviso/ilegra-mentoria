output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.*.id
}