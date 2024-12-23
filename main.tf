resource "aws_media_convert_queue" "queue" {
  name         = var.queue_name
  pricing_plan = var.queue_pricing_plan

  status = var.status

}

module "iam_role" {
  source  = "dasmeta/iam/aws//modules/role"
  version = "1.2.1"

  name = "mediaconverter-${var.iam_role_name_suffix}"

  policy = [
    {
      actions   = var.s3_iam_actions
      resources = var.s3_arns
    }
  ]

  trust_relationship = [
    {
      principals = {
        type        = "Service"
        identifiers = ["mediaconvert.amazonaws.com"]
      },
      actions = ["sts:AssumeRole"]
    }
  ]

}

module "eventbridge" {
  source  = "terraform-aws-modules/eventbridge/aws"
  version = "3.13.0"

  create_bus  = var.create_bus
  bus_name    = var.bus_name
  create_role = false

  rules   = { for rule in local.rules : rule.name => rule }
  targets = local.targets
}

module "sqs" {
  source          = "dasmeta/modules/aws//modules/sqs"
  version         = "2.18.2"
  create_iam_user = false

  name = var.queue_name
}


data "aws_iam_policy_document" "eventbridge_to_sqs" {
  statement {
    actions   = ["sqs:SendMessage"]
    resources = [module.sqs.queue_arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [module.eventbridge.eventbridge_bus_arn]
    }
  }
}

resource "aws_sqs_queue_policy" "eventbridge_policy" {
  queue_url = "https://sqs.${data.aws_region.current.name}.amazonaws.com/${data.aws_caller_identity.current.account_id}/${module.sqs.queue_name}"

  policy = data.aws_iam_policy_document.eventbridge_to_sqs.json
}
