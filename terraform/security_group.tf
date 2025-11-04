#Security Group for levelupvpc
resource "aws_security_group" "allow-levelup-ssh" {
  name        = local.SG_NAME
  description = var.SG_DESCRIPTION

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.sg-tag
}