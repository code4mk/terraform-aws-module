locals {
  project_name = var.project_name
}

# create public subnet - 1
resource "aws_subnet" "this" {
  count                   = length(var.subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnets[count.index].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnets[count.index].zone_name
  tags = {
    "Name" = "${local.project_name}_public_${var.subnets[count.index].tag_name}"
  }
}


# create route table (public)
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    "Name" = "${local.project_name}_${var.table_tag_name}"
  }
}

# public route table association
resource "aws_route_table_association" "this" {
  count          = length(aws_subnet.this)
  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.this.id
}