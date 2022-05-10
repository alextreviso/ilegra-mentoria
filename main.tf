terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = ">= 3"
  }

  cloud {
    organization = "atreviso"
    workspaces {
      name = "ilegra-mentoria"
    }
  }
}

provider "aws" {
  region                = var.region
}

module "vpc" {
  source                = "github.com/alextreviso/ilg-atreviso//modules/vpc"
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  region                = var.region
  env                   = var.env
  private_subnets       = module.vpc.private_subnets
  public_subnets        = module.vpc.public_subnets
  internet_gateway      = module.vpc.internet_gateway
}