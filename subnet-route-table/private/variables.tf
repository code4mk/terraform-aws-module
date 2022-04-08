variable "vpc_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "table_tag_name" {
  type = string
}

variable "project_name" {
  type    = string
  default = "infrastructure"
}

variable "subnets" {
  type = list(object({
    cidr      = string
    zone_name = string
    tag_name  = string
  }))
}