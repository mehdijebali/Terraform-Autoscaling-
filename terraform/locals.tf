locals {
  SG_NAME  = "allow-levelup-ssh"
  ami-name = var.LD_NAME == "centos" ? "centos-template-pkr-*" : "ubuntu-template-pkr-*"

  sg-tag = {
    Name = local.SG_NAME
  }
}