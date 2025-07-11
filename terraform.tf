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

#⚠️ If you destroyed everything (including S3 & DynamoDB),
#temporarily comment out this backend block before applying,
#then apply to create S3 bucket and DynamoDB table,
#then uncomment this block and run terraform init -reconfigure and apply again to use remote backend.