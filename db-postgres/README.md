# db - postgres (module)

* create db subnet group 
* create db instance

```bash 
module "db_postgres" {
  source = "./modules/db-postgres"
  project_name = local.project_name
  
  # create db subnet groupd
  subnets = [
    module.private_subnet_setup.subnets[1].id,
    module.private_subnet_setup.subnets[2].id
  ]
  subnet_group_tag_name = "us-east-2a-2b"

  # db create
  options = {
    identifier: "terraform-module"
    engine = "postgres"
    instance = "db.t3.micro"
    storage = 20
    version = "13.4",
    tag_name = ""
    db: {
      db_name = "",
      username = "",
      password = "",
      port = "5432"
    }
  }

}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_options"></a> [options](#input\_options) | n/a | <pre>object({<br>    identifier : string,<br>    storage : number,<br>    engine : string,<br>    version : string,<br>    instance : string,<br>    tag_name : string,<br>    security_groups : list(string)<br>    db : object({<br>      db_name : string,<br>      username : string,<br>      password : string,<br>      port : string<br>    })<br><br>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnet_group_tag_name"></a> [subnet\_group\_tag\_name](#input\_subnet\_group\_tag\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->