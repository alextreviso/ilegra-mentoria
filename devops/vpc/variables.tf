variable "vpc_name" {}
variable "vpc_cidr" {}
variable "region" {}
variable "env" {}
variable "public_subnets_cidrs" {}
variable "private_subnets_cidrs" {}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "internet_gateway" {
  type = list(string)
}