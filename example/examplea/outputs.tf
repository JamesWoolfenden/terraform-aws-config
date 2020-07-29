output "bucket" {
  description = "The bucket name that config writes output to."
  value       = module.config.bucket
}

output "bucket_arn" {
  description = "The bucket ARN that config writes output to."
  value       = module.config.bucket_arn
}

output "delivery_channel_id" {
  description = "The name of the delivery channel."
  value       = module.config.delivery_channel_id
}

output "recorder_id" {
  description = "Name of the recorder."
  value       = module.config.recorder_id
}

output "rule_arns" {
  description = "The ARNs of the config rules"
  value       = module.config.rule_arns
}

output "rule_ids" {
  description = "The IDs of the config rules"
  value       = module.config.rule_ids
}

output "topic_arn" {
  description = "The ARN of the SNS topic AWS Config writes events to."
  value       = module.config.topic_arn
}
