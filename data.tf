# Data source to get available AZs in first region
data "aws_availability_zones" "first_provider_azs" {
    provider = aws.first_provider
    state    = "available"
}

# Data source to get available AZs in second region
data "aws_availability_zones" "second_provider_azs" {
    provider = aws.second_provider
    state    = "available"
}

# Data source to get available AZs in third region
data "aws_availability_zones" "third_provider_azs" {
    provider = aws.third_provider
    state    = "available"
}

# Data source for Primary region AMI (Ubuntu 24.04 LTS)
data "aws_ami" "ami_1a" {
    provider    = aws.first_provider
    most_recent = true
    owners      = ["099720109477"] # Canonical (Ubuntu)

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

# Data source for Second region AMI (Ubuntu 24.04 LTS)
data "aws_ami" "ami_1b" {
    provider    = aws.second_provider
    most_recent = true
    owners      = ["099720109477"] # Canonical (Ubuntu)

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

# Data source for Third region AMI (Ubuntu 24.04 LTS)
data "aws_ami" "ami_1c" {
    provider    = aws.third_provider
    most_recent = true
    owners      = ["099720109477"] # Canonical (Ubuntu)

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}
