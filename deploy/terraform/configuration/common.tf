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

# Common vars
variable "stack_name_prefix"              { default = "simple-sinatra-app" }
variable "aws_region"                     { default = "ap-southeast-2" }
variable "vpc_cidr"                       { default = "192.168.16.0/20" }
variable "publicdmz_subnet_a_cidr"        { default = "192.168.16.0/24" }
variable "publicdmz_subnet_b_cidr"        { default = "192.168.17.0/24" }
variable "publicdmz_subnet_c_cidr"        { default = "192.168.18.0/24" }
variable "publicdmz_subnet_reserved_cidr" { default = "192.168.19.0/24" }
variable "private_subnet_a_cidr"          { default = "192.168.20.0/24" }
variable "private_subnet_b_cidr"          { default = "192.168.21.0/24" }
variable "private_subnet_c_cidr"          { default = "192.168.22.0/24" }
variable "private_subnet_reserved_cidr"   { default = "192.168.23.0/24" }
variable "data_subnet_a_cidr"             { default = "192.168.24.0/24" }
variable "data_subnet_b_cidr"             { default = "192.168.25.0/24" }
variable "data_subnet_c_cidr"             { default = "192.168.26.0/24" }
variable "data_subnet_reserved_cidr"      { default = "192.168.27.0/24" }
