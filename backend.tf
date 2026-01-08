terraform {
    backend "s3" {
        bucket       = "multi-region-vpc-peering-project-111000"
        key          = "prod/terraform.tfstate"
        region       = "us-east-1"
        encrypt      = true
        use_lockfile = true
    }
}
