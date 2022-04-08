# Project name
variable "project_name" {
  type = string
}

# Security group name
variable "name" {
  type = string
}

# Security group description
variable "description" {
  type    = string
  default = ""
}

# vpc id
variable "vpc_id" {
  type = string
}

# inbound rules - ingress
variable "ingress" {
  type = list(object({
    protocol    = string
    port        = list(number)
    cidr_blocks = list(string)
  }))
}

# outbound rules - ingress
variable "egress" {
  type = list(object({
    protocol    = string
    port        = list(number)
    cidr_blocks = list(string)
  }))
}