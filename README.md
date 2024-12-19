# terraform-aws-media-converter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | dasmeta/iam/aws//modules/role | 1.2.1 |

## Resources

| Name | Type |
|------|------|
| [aws_media_convert_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/media_convert_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | queue name | `string` | n/a | yes |
| <a name="input_queue_pricing_plan"></a> [queue\_pricing\_plan](#input\_queue\_pricing\_plan) | pricing method of the plan. Valid values are ON\_DEMAND or RESERVED | `string` | `"ON_DEMAND"` | no |
| <a name="input_status"></a> [status](#input\_status) | A status of the queue. Valid values are ACTIVE or RESERVED. | `string` | `"ACTIVE"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
