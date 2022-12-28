terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

module "web_ec2" {
  source = "../../module/ec2"
##### Khai bao tham so cho provider ######
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key

##### Khai bao tham so cho EC2 ######
  project_name = var.project_name
  ami           = var.ami
  instance_type = var.instance_type
  key_ec2 = var.key_ec2
  subnet_id = var.subnet_id
}

output "instance_id" {
  description = "Public DNS of the EC2 instance"
  value       = module.web_ec2.instance_id
}

output "instance_ip" {
  description = "public ip of instance"
  value       = module.web_ec2.instance_ip
}