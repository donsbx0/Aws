provider "aws" {
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name = var.key_ec2

  tags = {
    Name = var.project_name
  }
}

output "instance_id" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "instance_ip" {
  description = "public ip of instance"
  value       = aws_instance.web.public_ip
}
