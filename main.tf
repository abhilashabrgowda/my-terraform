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

data "vault_kv_secret_v2" "db_creds" {
    mount = "secret"
    name  = "db"
}

resource "aws_instance" "k8s_node" {
    ami = data.aws_ami.k8s.id
    instance_type = "t2.micro"
    key_name = "k8s"
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    tags = {
      Name = "ProvisionedEC2"
    }
}

