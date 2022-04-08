locals {
  project_name = var.project_name
}

# set database subnet group
resource "aws_db_subnet_group" "this" {
  name       = "${local.project_name}_${var.subnet_group_tag_name}"
  subnet_ids = var.subnets
  tags = {
    "Name" = "${local.project_name}_${var.subnet_group_tag_name}"
  }
}

resource "aws_db_instance" "this" {
  allocated_storage      = var.options.storage
  engine                 = var.options.engine
  engine_version         = var.options.version
  instance_class         = var.options.instance
  db_name                = var.options.db.db_name
  port                   = var.options.db.port
  username               = var.options.db.username
  password               = var.options.db.password
  skip_final_snapshot    = true
  identifier             = var.options.identifier
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.options.security_groups
  publicly_accessible    = true
  tags = {
    "Name" = "${local.project_name}_${var.options.tag_name}"
  }
}