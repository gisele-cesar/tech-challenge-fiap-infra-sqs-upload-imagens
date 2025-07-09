variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "tech-challenge-fiap"
}

variable "sqs_visibility_timeout" {
  description = "Timeout de visibilidade das mensagens SQS em segundos"
  type        = number
  default     = 300
}

variable "sqs_message_retention_seconds" {
  description = "Tempo de retenção das mensagens em segundos (1 dia a 14 dias)"
  type        = number
  default     = 1209600 # 14 dias
}

variable "sqs_delay_seconds" {
  description = "Delay para entrega das mensagens em segundos"
  type        = number
  default     = 0
}

variable "sqs_max_message_size" {
  description = "Tamanho máximo da mensagem em bytes"
  type        = number
  default     = 262144 # 256 KB
}
