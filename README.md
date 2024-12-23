# terraform-aws-media-converter
This module allows creating a media converter queue alongside with related sqs queue and EventBrdige bus to connect media converter events to sqs queue.


# Simple example
```hcl
module "mediaconverter" {
  source = "dasmeta/mediaconverter_flow/aws"

  queue_name = "test-queue"

  rules = {
    orders = {
      name           = "test-mediaconvert"
      description    = "Capture mediaconvert job events"
      event_bus_name = "default"
      event_pattern  = jsonencode({ "source" : ["aws.mediaconvert"] })
      is_enabled = true
    }
  }
  targets = {
    orders = [
      {
        arn  = "arn:aws:sqs:eu-central-1:123456789012:test-queue"
        name = "sqs-target-test"
      }
    ]
  }
}

```

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
| <a name="input_bus_name"></a> [bus\_name](#input\_bus\_name) | name of the eventbridge bus | `string` | `"default"` | no |
| <a name="input_create_bus"></a> [create\_bus](#input\_create\_bus) | boolean flag to create a new flag | `bool` | `false` | no |
| <a name="input_iam_role_name_suffix"></a> [iam\_role\_name\_suffix](#input\_iam\_role\_name\_suffix) | string to be attached to MediaConverter to create iam role name. | `string` | `""` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | queue name | `string` | `"simple-queue-name"` | no |
| <a name="input_queue_pricing_plan"></a> [queue\_pricing\_plan](#input\_queue\_pricing\_plan) | pricing method of the plan. Valid values are ON\_DEMAND or RESERVED | `string` | `"ON_DEMAND"` | no |
| <a name="input_rules_targets"></a> [rules\_targets](#input\_rules\_targets) | event patterns for eventbridge rules | `list(map(any))` | `[]` | no |
| <a name="input_s3_arns"></a> [s3\_arns](#input\_s3\_arns) | list of s3 bucket arns which mediaconverter will need access | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_s3_iam_actions"></a> [s3\_iam\_actions](#input\_s3\_iam\_actions) | list of actions to be attached to iam role for mediaconverter | `list(string)` | <pre>[<br/>  "s3:*",<br/>  "s3-object-lambda:*"<br/>]</pre> | no |
| <a name="input_status"></a> [status](#input\_status) | A status of the queue. Valid values are ACTIVE or RESERVED. | `string` | `"ACTIVE"` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | Map of targets to be linked to the rule. Currently only sqs targets are supported | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventbrdige_bus"></a> [eventbrdige\_bus](#output\_eventbrdige\_bus) | eventbridge bus |
| <a name="output_eventbridge_bus_arn"></a> [eventbridge\_bus\_arn](#output\_eventbridge\_bus\_arn) | eventbrige bus arn |
| <a name="output_eventbridge_rules"></a> [eventbridge\_rules](#output\_eventbridge\_rules) | rules for eventbridge bus |
| <a name="output_eventbridge_targets"></a> [eventbridge\_targets](#output\_eventbridge\_targets) | targets for eventbridge bus |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | mediaconverter iam role arn |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | mediaconverter iam role id |
| <a name="output_iam_role_policy"></a> [iam\_role\_policy](#output\_iam\_role\_policy) | role policy |
| <a name="output_mediaconvert_queue_id"></a> [mediaconvert\_queue\_id](#output\_mediaconvert\_queue\_id) | mediaconverter queue id |
| <a name="output_mediaconverter_queue_arn"></a> [mediaconverter\_queue\_arn](#output\_mediaconverter\_queue\_arn) | mediaconverter queue arn |
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | sqs arn |
| <a name="output_sqs_id"></a> [sqs\_id](#output\_sqs\_id) | sqs id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
