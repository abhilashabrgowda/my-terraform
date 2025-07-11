variable "ec2_ami" {
    type = string
    default = "ami-020cba7c55df1f615"
}

variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
}

variable "ec2_name" {
    type = string
    default = "terraform_ec2"
}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
    default = "my-bucket-from-module"
}

variable "region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "dynamodb_table_name" {
    description = "Name of the DynamoDB table"
    type = string
    default = "terraform-lock-table"
}
