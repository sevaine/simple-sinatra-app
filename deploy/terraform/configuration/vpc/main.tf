provider "aws" {
  region = "ap-southeast-2"
}
terraform {
  required_version = ">= 0.11.1"
  backend "s3" {
    encrypt = "true"
    bucket  = "sevaine-sandpit-tfconfig"
    key     = "terraform.tfstate"
    region  = "ap-southeast-2"
  }
}

module "simple_vpc" {
  source                          = "../../modules/simple_vpc"
  aws_region                      = "ap-southeast-2"
  vpc_cidr                        = "192.168.16.0/20"
  publicdmz_subnet_a_cidr         = "192.168.16.0/24"
  publicdmz_subnet_b_cidr         = "192.168.17.0/24"
  publicdmz_subnet_c_cidr         = "192.168.18.0/24"
  publicdmz_subnet_reserved_cidr  = "192.168.19.0/24"
  private_subnet_a_cidr           = "192.168.20.0/24"
  private_subnet_b_cidr           = "192.168.21.0/24"
  private_subnet_c_cidr           = "192.168.22.0/24"
  private_subnet_reserved_cidr    = "192.168.23.0/24"
  data_subnet_a_cidr              = "192.168.24.0/24"
  data_subnet_b_cidr              = "192.168.25.0/24"
  data_subnet_c_cidr              = "192.168.26.0/24"
  data_subnet_reserved_cidr       = "192.168.27.0/24"
}
