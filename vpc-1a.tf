# VPC 1A
resource "aws_vpc" "vpc_1a" {
    provider             = aws.first_provider
    cidr_block           = var.vpc_cidr[0]
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1A"
        }
    )
}

# Internet Gateway 1A
resource "aws_internet_gateway" "vpc-1a-igw" {
    provider = aws.first_provider
    vpc_id   = aws_vpc.vpc_1a.id

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1A-IGW"
        }
    )
}

# Public Subnet 1A
resource "aws_subnet" "public_subnet_vpc_1a" {
    provider                = aws.first_provider
    vpc_id                  = aws_vpc.vpc_1a.id
    cidr_block              = var.public_subnet[0]
    availability_zone       = data.aws_availability_zones.first_provider_azs.names[0]
    map_public_ip_on_launch = true

    tags = merge(
        local.common_tags, {
            Name        = "Public-Subnet-VPC-1A"
        }
    )
}

# Private Subnet 1A
resource "aws_subnet" "private_subnet_vpc_1a" {
    provider          = aws.first_provider
    vpc_id            = aws_vpc.vpc_1a.id
    cidr_block        = var.private_subnet[0]
    availability_zone = data.aws_availability_zones.first_provider_azs.names[0]

    tags = merge(
        local.common_tags, {
            Name        = "Private-Subnet-VPC-1A"
        }
    )
}

#E Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip_vpc_1a" {
    provider = aws.first_provider
    domain   = "vpc"

    tags = merge(
        local.common_tags, {
            Name        = "NAT-Gateway-EIP-VPC-1A"
        }
    )
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway_vpc_1a" {
    provider      = aws.first_provider
    subnet_id     = aws_subnet.public_subnet_vpc_1a.id
    allocation_id = aws_eip.nat_eip_vpc_1a.id

    tags = merge(
        local.common_tags, {
            Name        = "NAT-Gateway-VPC-1A"
        }
    )
}

# Public Route Table
resource "aws_route_table" "public_rt_vpc_1a" {
    provider = aws.first_provider
    vpc_id   = aws_vpc.vpc_1a.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc-1a-igw.id
    }

    tags = merge(
        local.common_tags, {
            Name        = "Public-RT-VPC-1A"
        }
    )
}

# Associate Public RT to Public Subnet
resource "aws_route_table_association" "public_rta_vpc_1a" {
    provider       = aws.first_provider
    subnet_id      = aws_subnet.public_subnet_vpc_1a.id
    route_table_id = aws_route_table.public_rt_vpc_1a.id
}

# Private Route Table
resource "aws_route_table" "private_rt_vpc_1a" {
    provider = aws.first_provider
    vpc_id   = aws_vpc.vpc_1a.id

    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_vpc_1a.id
    }

    route {
        cidr_block                = var.vpc_cidr[1]
        vpc_peering_connection_id = aws_vpc_peering_connection.peering_1a_to_1b.id
    }

    route {
        cidr_block                = var.vpc_cidr[2]
        vpc_peering_connection_id = aws_vpc_peering_connection.peering_1a_to_1c.id
    }

    tags = merge(
        local.common_tags, {
            Name        = "Private-RT-VPC-1A"
        }
    )
}

# Associate Private RT to Private Subnet
resource "aws_route_table_association" "private_rta_vpc_1a" {
    provider       = aws.first_provider
    subnet_id      = aws_subnet.private_subnet_vpc_1a.id
    route_table_id = aws_route_table.private_rt_vpc_1a.id
}

