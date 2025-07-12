# Outputs das filas SQS
output "upload_notifications_queue_url" {
  description = "URL da fila SQS para notificações de upload"
  value       = aws_sqs_queue.upload_notifications.url
}

output "upload_notifications_queue_arn" {
  description = "ARN da fila SQS para notificações de upload"
  value       = aws_sqs_queue.upload_notifications.arn
}

# Outputs do IAM
output "sqs_access_role_arn" {
  description = "ARN do IAM Role para acesso às filas SQS"
  value       = aws_iam_role.sqs_access_role.arn
}

output "sqs_access_role_name" {
  description = "Nome do IAM Role para acesso às filas SQS"
  value       = aws_iam_role.sqs_access_role.name
}

output "sqs_access_policy_arn" {
  description = "ARN da Policy para acesso às filas SQS"
  value       = aws_iam_policy.sqs_access_policy.arn
}

# Resumo de todas as filas criadas
output "queue_summary" {
  description = "Resumo de todas as filas SQS criadas"
  value = {
    upload_notifications = {
      name = aws_sqs_queue.upload_notifications.name
      url  = aws_sqs_queue.upload_notifications.url
      arn  = aws_sqs_queue.upload_notifications.arn
    }
  }
}
