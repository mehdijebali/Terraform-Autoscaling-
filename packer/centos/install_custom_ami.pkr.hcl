packer {
  required_version = ">= 1.14.0"

  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.2.0"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.1.0"
    }
  }
}

source "amazon-ebs" "al2023" {
  ami_name      = "al2023-template-pkr-${formatdate("YYYY-MM-DD-hhmmss", timestamp())}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  ssh_username  = "ec2-user"
  source_ami_filter {
  filters = {
    name                = "al2023-ami-*-x86_64"
    architecture        = "x86_64"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  owners      = ["137112412989"] 
  most_recent = true
  }
}

build {
  sources = ["source.amazon-ebs.al2023"]

  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
  }
}
