data "aws_ami" "k8s" {
    most_recent = true
    owners = ["619071338726"]  # This is the AMI owner ID you found

    filter {
      name = "name"
      values = ["k8s"]
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
