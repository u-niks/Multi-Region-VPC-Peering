# Common Tags
locals {
    common_tags = {
    	Project_Name   = "Multi-Region-VPC-Peering"
        Environment    = "PROD"
        Owner          = "Nikhil Jadhav"
        Managed-By     = "Terraform"
        Cloud-Provider = "AWS"
    }
}

# Instance Type
variable "instance_type" {
    description = "Type of EC2 Instance"
    type        = string
    default     = "t2.micro"
}

# List of Regions
variable "regions" {
    description = "List of AWS Regions"
    type        = list(string)
    default     = [ "us-east-1", "us-east-2", "us-west-2" ]
}

# VPC CIDRs
variable "vpc_cidr" {
    description = "VPC CIDR Block"
    type        = list(string)
    default     = [ "10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16" ]
}

# Public Subnets
variable "public_subnet" {
    description = "List of Public Subnets"
    type = list(string)
    default = [ "10.0.0.0/24", "10.1.0.0/24", "10.2.0.0/24" ]
}

# Private Subnets
variable "private_subnet" {
    description = "List of Private Subnets"
    type = list(string)
    default = [ "10.0.1.0/24", "10.1.1.0/24", "10.2.1.0/24" ]
}
