resource "aws_instance" "my-first-ec2" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    count = 2
    tags = {
      Name = "${var.ec2_name}-${count.index + 1}"
    }
}

module "my_s3_bucket" {
    source = "./modules/s3"
    bucket_name = var.bucket_name
    region = var.region
}

module "dynamodb_lock_table" {
    source = "./modules/dynamoDB"
    table_name = var.dynamodb_table_name
}