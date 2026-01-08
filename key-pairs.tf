# -----------------------------------------------------------------------
# Key Pair for VPC-1A
# -----------------------------------------------------------------------

# RSA Key Pair for VPC Peering
resource "tls_private_key" "vpc_1a_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# AWS Key Pair
resource "aws_key_pair" "vpc_1a_key_pair" {
    provider   = aws.first_provider
    key_name   = "VPC-1A-Key-Pair"
    public_key = tls_private_key.vpc_1a_private_key.public_key_openssh

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1A-Key-Pair"
        }
    )
}

# Saving Private Key Locally
resource "local_file" "vpc_1a_peering_pem" {
    content         = tls_private_key.vpc_1a_private_key.private_key_pem
    filename        = "VPC-1A-Key-Pair.pem"
    file_permission = "0400"
}



# -----------------------------------------------------------------------
# Key Pair for VPC-1B
# -----------------------------------------------------------------------

# RSA Key Pair for VPC Peering
resource "tls_private_key" "vpc_1b_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# AWS Key Pair
resource "aws_key_pair" "vpc_1b_key_pair" {
    provider   = aws.second_provider
    key_name   = "VPC-1B-Key-Pair"
    public_key = tls_private_key.vpc_1b_private_key.public_key_openssh

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1B-Key-Pair"
        }
    )
}

# Saving Private Key Locally
resource "local_file" "vpc_1b_peering_pem" {
    content         = tls_private_key.vpc_1b_private_key.private_key_pem
    filename        = "VPC-1B-Key-Pair.pem"
    file_permission = "0400"
}



# -----------------------------------------------------------------------
# Key Pair for VPC-1C
# -----------------------------------------------------------------------

# RSA Key Pair for VPC Peering
resource "tls_private_key" "vpc_1c_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# AWS Key Pair
resource "aws_key_pair" "vpc_1c_key_pair" {
    provider   = aws.third_provider
    key_name   = "VPC-1C-Key-Pair"
    public_key = tls_private_key.vpc_1c_private_key.public_key_openssh

    tags = merge(
        local.common_tags, {
            Name        = "VPC-1C-Key-Pair"
        }
    )
}

# Saving Private Key Locally
resource "local_file" "vpc_1c_peering_pem" {
    content         = tls_private_key.vpc_1c_private_key.private_key_pem
    filename        = "VPC-1C-Key-Pair.pem"
    file_permission = "0400"
}
