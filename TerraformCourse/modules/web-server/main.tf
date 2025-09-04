resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  key_name                    = var.keyname
  connection {
    user        = "ubuntu"
    private_key = var.private_key
    host        = self.public_ip
  }
  provisioner "local-exec" {
    command = "chmod 600 ${var.private_key_location}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo rm -rf /tmp",
      "sudo git clone https://github.com/hashicorp/demo-terraform-101 /tmp",
      "sudo sh /tmp/assets/setup-web.sh"
    ]
  }
  lifecycle {
    ignore_changes = [security_groups]
  }
  tags = {
    "Name"        = "Web-Server"
    "Environment" = "Training"
  }
}