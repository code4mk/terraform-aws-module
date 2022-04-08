# subnet_route_table module 
* create subnets.
* create route table.
* association route table and subnets.

```bash 
module "private_subnet_setup" {

  source = "./modules/subnet_route_table/private"
  vpc_id = ""

  // create private subnets
  subnets = [
    {cidr = "10.0.1.0/24", tag_name = "express_app_private_subnet"},
    {cidr = "10.0.2.0/24", tag_name = "database_private_subnet"},
  ]

  // create route table and association with private subnets.
  nat_gateway_id = ""
  project_name = ""
  table_tag_name = ""
  
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nat_gateway_id"></a> [nat\_gateway\_id](#input\_nat\_gateway\_id) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"infrastructure"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | <pre>list(object({<br>    cidr      = string<br>    zone_name = string<br>    tag_name  = string<br>  }))</pre> | n/a | yes |
| <a name="input_table_tag_name"></a> [table\_tag\_name](#input\_table\_tag\_name) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | outputs |
<!-- END_TF_DOCS -->