# VPC Peering Connection : VPC-1A to VPC-1B
resource "aws_vpc_peering_connection" "peering_1a_to_1b" {
    vpc_id      = aws_vpc.vpc_1a.id
    peer_vpc_id = aws_vpc.vpc_1b.id
    peer_region = var.regions[1]
    auto_accept = false

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1A-to-1B"
        }
    )
}

resource "aws_vpc_peering_connection_accepter" "accept_1a_to_1b" {
    provider                  = aws.second_provider
    vpc_peering_connection_id = aws_vpc_peering_connection.peering_1a_to_1b.id
    auto_accept               = true
}


# VPC Peering Connection : VPC-1A to VPC-1C
resource "aws_vpc_peering_connection" "peering_1a_to_1c" {
    vpc_id      = aws_vpc.vpc_1a.id
    peer_vpc_id = aws_vpc.vpc_1c.id
    peer_region = var.regions[2]
    auto_accept = false

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1A-to-1C"
        }
    )
}

resource "aws_vpc_peering_connection_accepter" "accept_1a_to_1c" {
    provider                  = aws.third_provider
    vpc_peering_connection_id = aws_vpc_peering_connection.peering_1a_to_1c.id
    auto_accept               = true
}

# VPC Peering Connection : VPC-1B to VPC-1C
resource "aws_vpc_peering_connection" "peering_1b_to_1c" {
    vpc_id      = aws_vpc.vpc_1b.id
    peer_vpc_id = aws_vpc.vpc_1c.id
    peer_region = var.regions[2]
    auto_accept = false

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1B-to-1C"
        }
    )
}

resource "aws_vpc_peering_connection_accepter" "accept_1b_to_1c" {
    provider                  = aws.third_provider
    vpc_peering_connection_id = aws_vpc_peering_connection.peering_1b_to_1c.id
    auto_accept               = true
}
