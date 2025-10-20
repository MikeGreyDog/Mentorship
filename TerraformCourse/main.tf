data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}
resource "tls_private_key" "generated" {
  algorithm = "RSA"
}
resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "MyAWSKey.pem"
}
resource "aws_key_pair" "generated" {
  key_name   = "MyAWSKey"
  public_key = tls_private_key.generated.public_key_openssh
  lifecycle {
    ignore_changes = [key_name]
  }
}
resource "aws_security_group" "web-server-sg" {
  name   = "allow-all-ssh-and-web"
  vpc_id = module.vpc.vpc_id
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow ${ingress.key} access on port ${ingress.value}"
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Work with modules (local and remote sources)
module "server" {
  source      = "./modules/server"
  ami         = data.aws_ami.ubuntu.id
  environment = var.environment
  subnet_id   = module.vpc.public_subnet_ids["public_subnet_1"]
  security_groups = [
    aws_security_group.web-server-sg.id
  ]
}
module "web-server" {
  source      = "./modules/web-server"
  ami         = data.aws_ami.ubuntu.id
  environment = var.environment
  subnet_id   = module.vpc.public_subnet_ids["public_subnet_2"]
  security_groups = [
    aws_security_group.web-server-sg.id
  ]
  keyname              = aws_key_pair.generated.key_name
  private_key          = tls_private_key.generated.private_key_pem
  private_key_location = local_file.private_key_pem.filename
}
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
}
module "vpc" {
  source   = "git::https://github.com/MikeGreyDog/terraform-aws-vpc.git?ref=v0.0.1"
  vpc_name = "main-vpc"
}