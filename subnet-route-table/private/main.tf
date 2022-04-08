locals {
  project_name = var.project_name
}

resource "aws_subnet" "this" {
  count                   = length(var.subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnets[count.index].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnets[count.index].zone_name
  tags = {
    "Name" = "${local.project_name}_private_${var.subnets[count.index].tag_name}}"
  }
}

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }
  tags = {
    "Name" = "${local.project_name}_${var.table_tag_name}"
  }
}

resource "aws_route_table_association" "this" {
  count          = length(aws_subnet.this)
  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.this.id
}