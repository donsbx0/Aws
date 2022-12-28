
variable "project_name" {
  default     = "codestar-lab3"
  type        = string
  description = "project name injected into task"
}

variable "ami" {
  default     = ""
  type        = string
  description = "ami id for creating Ec2 instance"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "instance type for creating EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "subnet id for EC2 instance to be included"
}

variable "region" {
  type        = string
  default     = ""
  description = "Region for creating EC2 instance"
}

variable "access_key" {
  type        = string
  description = "access key for EC2 instance to be included"
}

variable "secret_key" {
  type        = string
  description = "secret key for EC2 instance to be included"
}

variable "key_ec2" {
  type        = string
  description = "secret key for EC2 instance to be included"
}