variable "project_name" {
  type = string
}
variable "subnets" {
  type = list(string)
}

variable "subnet_group_tag_name" {
  type = string
}

variable "options" {
  type = object({
    identifier : string,
    storage : number,
    engine : string,
    version : string,
    instance : string,
    tag_name : string,
    security_groups : list(string)
    db : object({
      db_name : string,
      username : string,
      password : string,
      port : string
    })

  })
}