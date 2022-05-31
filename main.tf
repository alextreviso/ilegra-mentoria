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
  source  = "app.terraform.io/atreviso/vpc/aws"
  version = "1.0.0"
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

module "rds" {
  source  = "app.terraform.io/atreviso/rds/aws"
  version = "1.0.0"
  database_name             = var.database_name
  allowed_cidrs             = var.allowed_cidrs
  engine                    = var.engine
  engine_version            = var.engine_version
  db_username               = var.db_username
  db_password               = var.db_password
  db_port                   = var.db_port
  deletion_protection       = var.deletion_protection
  vpc_id                    = module.vpc.vpc_id
  private_subnets_ids       = module.vpc.public_subnets
  storage_type              = var.storage_type
  allocated_storage         = var.allocated_storage
  instance_class            = var.instance_class
  publicly_accessible       = var.publicly_accessible
  region                    = var.region
  env                       = var.env
}