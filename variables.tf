variable "queue_name" {
    description = "queue name"
    type = string
}

variable "queue_pricing_plan" {
    description = "pricing method of the plan. Valid values are ON_DEMAND or RESERVED"
    type = string
    default = "ON_DEMAND"
}

variable "status" {
    description = "A status of the queue. Valid values are ACTIVE or RESERVED."
    type = string
    default = "ACTIVE"
}