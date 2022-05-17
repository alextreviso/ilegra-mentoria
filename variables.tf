variable "vpc_name" {}
variable "vpc_cidr" {}
variable "region" {}
variable "env" {}
variable "profile" {}
variable "public_subnets_cidrs" {}
variable "private_subnets_cidrs" {}

variable "database_name" {}        
variable "allowed_cidrs" {}  
variable "engine" {}                 
variable "engine_version" {}           
variable "db_username" {}              
variable "db_password" {}             
variable "db_port" {}                
variable "deletion_protection" {}       
variable "vpc_id" {}          
variable "storage_type" {}         
