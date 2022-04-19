terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = ">= 3.37"
  }

  backend "s3" {
    bucket = "ilg-atreviso-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile                  = var.profile
  shared_credentials_files = ["~/.aws/credentials"]
}

module "vpc" {
  source                = "./vpc"
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