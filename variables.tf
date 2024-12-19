variable "queue_name" {
  description = "queue name"
  type        = string
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

variable "rules" {
  description = "List of EventBridge rules with their configuration"
  type        = map(any)

  #     {
  #     name           = string
  #     description    = optional(string, "EventBridge rule")
  #     event_bus_name = optional(string, "default")
  #     pattern        = string
  #     is_enabled     = optional(bool, true)
  #     # sqs_queue_name = string
  #     targets = list(object({
  #       arn   = string
  #       id    = string
  #       input = optional(map(any), null)
  #     }))
  #   }))
}

variable "sqs_queue_name" {
  description = "sqs query name"
  type        = string
  default     = "simple-queue-name"
}

variable "targets" {
  type = map(any)

}
