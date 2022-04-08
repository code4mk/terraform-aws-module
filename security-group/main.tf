# local variable
locals {
  project_name = var.project_name
}

# Security group resource
resource "aws_security_group" "this" {
  name        = "${local.project_name}_${var.name}"
  vpc_id      = var.vpc_id
  description = var.description
}

# ingress - inbound rules
resource "aws_security_group_rule" "ingress" {
  count             = length(var.ingress)
  type              = "ingress"
  from_port         = var.ingress[count.index].port[0]
  to_port           = var.ingress[count.index].port[1]
  protocol          = var.ingress[count.index].protocol
  cidr_blocks       = var.ingress[count.index].cidr_blocks
  security_group_id = aws_security_group.this.id
}

# egress - outbound rules
resource "aws_security_group_rule" "egress" {
  count             = length(var.egress)
  type              = "egress"
  from_port         = var.egress[count.index].port[0]
  to_port           = var.egress[count.index].port[1]
  protocol          = var.egress[count.index].protocol
  cidr_blocks       = var.egress[count.index].cidr_blocks
  security_group_id = aws_security_group.this.id
}
