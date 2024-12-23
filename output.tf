output "sqs_arn" {
  description = "ARN of the created SQS queue"
  value       = module.sqs.queue_arn
}

output "eventbridge_rules" {
  description = "rules for eventbridge bus"
  value       = local.rules
}

output "eventbridge_targets" {
  description = "targets for eventbridge bus"
  value       = local.targets
}

output "iam_role_arn" {
  description = "mediaconverter iam role arn"
  value       = module.iam_role.arn
}

output "iam_role_id" {
  description = "mediaconverter iam role id"
  value       = module.iam_role.id
}

output "eventbrdige_bus" {
  description = "eventbridge bus"
  value       = module.eventbridge.eventbridge_bus
}

output "eventbridge_bus_arn" {
  description = "eventbrige bus arn"
  value       = module.eventbridge.eventbridge_bus_arn
}

output "mediaconvert_queue_arn" {
  description = "mediaconverter queue arn"
  value       = aws_media_convert_queue.queue.arn
}

output "mediaconvert_queue_id" {
  description = "mediaconverter queue id"
  value       = aws_media_convert_queue.queue.id
}

output "sqs_id" {
  description = "sqs id"
  value       = module.sqs.queue_id
}

output "iam_role_policy" {
  description = "role policy"
  value       = data.aws_iam_policy_document.eventbridge_to_sqs
}
