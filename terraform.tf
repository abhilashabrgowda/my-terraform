terraform {
    required_version= "~> 1.12.2"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.2.0"
      }
    }

    backend "s3" {
    bucket = "my-bucket-from-module"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    }
}