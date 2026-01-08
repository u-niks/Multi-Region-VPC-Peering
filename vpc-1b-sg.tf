# Security Group for VPC 1A
resource "aws_security_group" "vpc_1b_sg" {
    provider    = aws.second_provider
    name        = "vpc-1b-sg"
    description = "Allow SSH and ICMP"
    vpc_id      = aws_vpc.vpc_1b.id

    ingress {
        description = "SSH Access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "ICMP Access"
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        cidr_blocks = var.vpc_cidr
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1B-SG"
        }
    )
}
