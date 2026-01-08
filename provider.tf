terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}


provider "aws" {
    region = var.regions[0]
}


provider "aws" {
    region = var.regions[0]
    alias  = "first_provider"
}

provider "aws" {
    region = var.regions[1]
    alias  = "second_provider"
}

provider "aws" {
    region = var.regions[2]
    alias  = "third_provider"
}
