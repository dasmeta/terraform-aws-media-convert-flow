output "sqs_arn" {
  description = "ARN of the created SQS queue"
  value       = module.sqs.queue_arn
}
