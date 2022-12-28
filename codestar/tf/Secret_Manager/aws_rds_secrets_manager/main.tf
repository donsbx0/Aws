terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"

    }
  }

}

provider "aws" {
  region  = "us-east-1"
  profile = "default"

  default_tags {
    tags = {
      App = "terraform_aws_rds_secrets_manager"
    }
  }
}
