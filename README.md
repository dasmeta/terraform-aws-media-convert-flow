# terraform-aws-media-converter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.81.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eventbridge"></a> [eventbridge](#module\_eventbridge) | terraform-aws-modules/eventbridge/aws | 3.13.0 |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | dasmeta/iam/aws//modules/role | 1.2.1 |
| <a name="module_sqs"></a> [sqs](#module\_sqs) | dasmeta/modules/aws//modules/sqs | 2.18.2 |

## Resources

| Name | Type |
|------|------|
| [aws_media_convert_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/media_convert_queue) | resource |
| [aws_sqs_queue_policy.eventbridge_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.eventbridge_to_sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | queue name | `string` | n/a | yes |
| <a name="input_queue_pricing_plan"></a> [queue\_pricing\_plan](#input\_queue\_pricing\_plan) | pricing method of the plan. Valid values are ON\_DEMAND or RESERVED | `string` | `"ON_DEMAND"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of EventBridge rules with their configuration | `map(any)` | n/a | yes |
| <a name="input_sqs_queue_name"></a> [sqs\_queue\_name](#input\_sqs\_queue\_name) | sqs query name | `string` | `"simple-queue-name"` | no |
| <a name="input_status"></a> [status](#input\_status) | A status of the queue. Valid values are ACTIVE or RESERVED. | `string` | `"ACTIVE"` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | ARN of the created SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
