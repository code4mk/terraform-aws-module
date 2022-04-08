
locals {
  project_name = var.project_name
}

resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance
  subnet_id                   = var.subnet_id
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = var.security_groups_id
  associate_public_ip_address = var.is_public_ip
  tags = {
    "Name" = "${local.project_name}_${var.tag_name}"
  }
}