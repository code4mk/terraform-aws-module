variable "ami" {
  type = string
}

variable "instance" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "security_groups_id" {
  type = list(string)
}

variable "tag_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "is_public_ip" {
  type    = bool
  default = true
}