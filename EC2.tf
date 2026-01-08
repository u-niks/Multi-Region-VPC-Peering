# -----------------------------------------------------------------------
# EC2 Instances 1A
# -----------------------------------------------------------------------

# Jump Server for VPC-1A
resource "aws_instance" "jump_server_1a" {
    provider               = aws.first_provider
    ami                    = data.aws_ami.ami_1a.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.public_subnet_vpc_1a.id
    key_name               = aws_key_pair.vpc_1a_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1a_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Jump-Server-1A"
        }
    )
}

# Private EC2 Instance 1A
resource "aws_instance" "private_ec2_1a" {
    provider               = aws.first_provider
    ami                    = data.aws_ami.ami_1a.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.private_subnet_vpc_1a.id
    key_name               = aws_key_pair.vpc_1a_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1a_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Private-EC2-Instance-1A"
        }
    )
}



# -----------------------------------------------------------------------
# EC2 Instances 1B
# -----------------------------------------------------------------------

# Jump Server for VPC-1B
resource "aws_instance" "jump_server_1b" {
    provider               = aws.second_provider
    ami                    = data.aws_ami.ami_1b.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.public_subnet_vpc_1b.id
    key_name               = aws_key_pair.vpc_1b_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1b_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Jump-Server-1B"
        }
    )
}

# Private EC2 Instance 1B
resource "aws_instance" "private_ec2_1b" {
    provider               = aws.second_provider
    ami                    = data.aws_ami.ami_1b.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.private_subnet_vpc_1b.id
    key_name               = aws_key_pair.vpc_1b_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1b_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Private-EC2-Instance-1B"
        }
    )
}



# -----------------------------------------------------------------------
# EC2 Instances 1C
# -----------------------------------------------------------------------

# Jump Server for VPC-1C
resource "aws_instance" "jump_server_1c" {
    provider               = aws.third_provider
    ami                    = data.aws_ami.ami_1c.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.public_subnet_vpc_1c.id
    key_name               = aws_key_pair.vpc_1c_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1c_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Jump-Server-1C"
        }
    )
}

# Private EC2 Instance 1C
resource "aws_instance" "private_ec2_1c" {
    provider               = aws.third_provider
    ami                    = data.aws_ami.ami_1c.id
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.private_subnet_vpc_1c.id
    key_name               = aws_key_pair.vpc_1c_key_pair.key_name
    vpc_security_group_ids = [ aws_security_group.vpc_1c_sg.id ]

    tags = merge(
        local.common_tags, {
            Name        = "Private-EC2-Instance-1C"
        }
    )
}
