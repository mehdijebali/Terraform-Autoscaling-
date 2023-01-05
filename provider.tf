provider "aws" {
  region     = var.AWS_REGION
}

data "aws_ami" "packer_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["custom-configuration-*"]
  }
}