variable "queue_name" {
  description = "queue name"
  type        = string
  default     = "simple-queue-name"
}

variable "queue_pricing_plan" {
  description = "pricing method of the plan. Valid values are ON_DEMAND or RESERVED"
  type        = string
  default     = "ON_DEMAND"
}

variable "status" {
  description = "A status of the queue. Valid values are ACTIVE or RESERVED."
  type        = string
  default     = "ACTIVE"
}

# variable "rules" {
#   description = "Map of EventBridge rules with their configuration"
#   type        = map(any)

# }

variable "targets" {
  type        = list(map(string))
  description = "Map of targets to be linked to the rule. Currently only sqs targets are supported"
  default     = []
}

variable "create_bus" {
  type        = bool
  description = "boolean flag to create a new flag"
  default     = false
}

variable "bus_name" {
  type        = string
  description = "name of the eventbridge bus"
  default     = "default"
}

variable "iam_role_name_suffix" {
  type        = string
  description = "string to be attached to MediaConverter to create iam role name. "
  default     = ""
}

variable "s3_iam_actions" {
  type        = list(string)
  description = "list of actions to be attached to iam role for mediaconverter"
  default     = ["s3:*", "s3-object-lambda:*"]
}

variable "s3_arns" {
  type        = list(string)
  description = "list of s3 bucket arns which mediaconverter will need access"
  default     = ["*"]
}

variable "rules_targets" {
  type        = list(map(any))
  description = "event patterns for eventbridge rules"
  default     = []
}
