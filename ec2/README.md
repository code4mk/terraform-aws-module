# AWS EC2 module
module create aws ec2 

# Usage

```bash
module "public_ec2" {
  source        = "github.com/code4mk/terraform-aws-module/ec2"
  project_name  = "your-project-name"
  ami           = "desired-region-ami"
  instance      = "t2.micro"
  subnet_id     = ""
  key_pair_name = "your-key-pair"
  tag_name      = "tag-name"
  is_public_ip  = false
  security_groups_id = []
}
```

* [ubuntu aws ami lists](https://cloud-images.ubuntu.com/locator/ec2/)

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
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | n/a | `string` | n/a | yes |
| <a name="input_is_public_ip"></a> [is\_public\_ip](#input\_is\_public\_ip) | n/a | `bool` | `true` | no |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_security_groups_id"></a> [security\_groups\_id](#input\_security\_groups\_id) | n/a | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->