
locals {
  rules = length(var.rules_targets) == 0 ? {
    orders = {
      name           = "${var.queue_name}"
      event_pattern  = jsonencode({ "source" : ["aws.mediaconvert"] })
      is_enabled     = true
      event_bus_name = var.bus_name
      description    = "rule to forward mediaconverter event to sqs"
    }
    } : {
    for rule in var.rules_targets : rule.rule_name => {
      name           = rule.rule_name
      event_pattern  = rule.event_pattern
      is_enabled     = true
      event_bus_name = var.bus_name
      description    = "${var.bus_name}-${rule.rule_name}-rule"
    }
  }

  targets = length(var.rules_targets) == 0 ? {
    orders = [{
      name = "${var.queue_name}"
      arn  = module.sqs.queue_arn
    }]
    } : {
    for rule in var.rules_targets : rule.rule_name => [{
      name = rule.target_name
      arn  = rule.arn
    }]
  }
}
