locals {
  SG_NAME  = "allow-levelup-ssh"
  ami-name = var.LD_NAME == "centos" ? "al2023-template-pkr-*" : "ubuntu-template-pkr-*"
  sg-tag = {
    Name = local.SG_NAME
  }
  default-tags = {
    Stack       = "Auto-Scaling",
    Environment = "Production"
  }
}