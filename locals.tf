
locals {
  rules = length(var.rules_targets) == 0 ? [
    for rule in ["default-role"] : {
      name = "${rule}"
      event_pattern = jsonencode({
        "source" : ["aws.mediaconvert"],
        "detail-type" : ["MediaConvert Job State Change"],
        }
      )
      enabled        = true
      event_bus_name = var.bus_name
      description    = "rule to forward mediaconverter event to sqs"
    }
    ] : [
    for rule in var.rules_targets : {
      name           = rule.rule_name
      event_pattern  = rule.event_pattern
      enabled        = true
      event_bus_name = var.bus_name
      description    = "${var.bus_name}-${rule.rule_name}-rule"
    }
  ]

  targets = length(var.rules_targets) == 0 ? {
    for rule in ["default-role"] : rule => [{
      name             = "${var.queue_name}"
      arn              = module.sqs.queue_arn
      message_group_id = var.sqs_fifo_queue ? "send-orders-to-fifo-sqs" : null
    }]
    } : {
    for rule in var.rules_targets : rule.rule_name => [{
      name             = rule.target_name
      arn              = contains(keys(rule), "target_arn") ? rule.target_arn : module.sqs.queue_arn
      message_group_id = var.sqs_fifo_queue ? "send-orders-to-fifo-sqs" : null
    }]
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
