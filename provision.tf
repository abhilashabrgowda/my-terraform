resource "null_resource" "install_httpd" {
    depends_on = [aws_instance.k8s_node]

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("${path.module}/k8s.pem")
      host = aws_instance.k8s_node.public_ip
    }

    provisioner "file" {
      source = "${path.module}/install.sh"
      destination = "/tmp/install.sh"
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/install.sh",
        "bash /tmp/install.sh"
      ]
    }
    
    triggers = {
     always_run = timestamp()
    }

}