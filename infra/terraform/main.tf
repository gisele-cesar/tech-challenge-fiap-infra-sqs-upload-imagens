# Fila para notificações de upload completo
resource "aws_sqs_queue" "upload_notifications" {
  name                       = "${var.project_name}-upload-notifications"
  delay_seconds              = var.sqs_delay_seconds
  max_message_size           = var.sqs_max_message_size
  message_retention_seconds  = var.sqs_message_retention_seconds
  visibility_timeout_seconds = var.sqs_visibility_timeout

  tags = {
    Name = "${var.project_name}-upload-notifications"
    Type = "MainQueue"
  }
}

# IAM Role para acesso às filas SQS
resource "aws_iam_role" "sqs_access_role" {
  name = "${var.project_name}-sqs-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-sqs-access-role"
  }
}

# Policy para acesso às filas SQS
resource "aws_iam_policy" "sqs_access_policy" {
  name        = "${var.project_name}-sqs-access-policy"
  description = "Policy para acesso às filas SQS do projeto"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl",
          "sqs:ListQueues"
        ]
        Resource = [
          aws_sqs_queue.upload_notifications.arn
        ]
      }
    ]
  })
}

# Anexar policy ao role
resource "aws_iam_role_policy_attachment" "sqs_access_attachment" {
  role       = aws_iam_role.sqs_access_role.name
  policy_arn = aws_iam_policy.sqs_access_policy.arn
}
