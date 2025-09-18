terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
  default_tags {
    tags = local.default-tags
  }
}

data "aws_ami" "packer_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = [local.ami-name]
  }
}