# Infraestrutura AWS SQS - Tech Challenge FIAP

Este projeto contém a infraestrutura como código (IaC) usando Terraform para criar filas Amazon SQS para o serviço de mensageria do projeto de upload de imagens.

## 📋 Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Conta AWS com permissões adequadas para criar recursos SQS e IAM

## 🏗️ Recursos Criados

Esta infraestrutura cria:

### Filas SQS:
- **upload-imagens**: Fila para mensagens de upload de imagens
- **upload-notifications**: Fila para notificações de upload completo

### IAM:
- **Role**: Para acesso às filas SQS
- **Policy**: Permissões específicas para operações SQS

## 🚀 Como usar

### 1. Configurar variáveis

Copie o arquivo de exemplo e configure suas variáveis:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edite o arquivo `terraform.tfvars` com suas configurações:

```hcl
aws_region   = "us-east-1"
project_name = "tech-challenge-fiap"
environment  = "dev"
```

### 2. Executar Terraform

```bash
# Navegar para o diretório terraform
cd infra/terraform

# Inicializar Terraform
terraform init

# Planejar as mudanças
terraform plan

# Aplicar a infraestrutura
terraform apply
```

### 3. Verificar recursos criados

Após a aplicação bem-sucedida, você verá os outputs com as URLs e ARNs das filas criadas.

## ⚙️ Configurações Principais

| Variável | Descrição | Valor Padrão |
|----------|-----------|--------------|
| `aws_region` | Região AWS | `us-east-1` |
| `project_name` | Nome do projeto | `tech-challenge-fiap` |
| `environment` | Ambiente (dev/staging/prod) | `dev` |
| `sqs_visibility_timeout` | Timeout de visibilidade (segundos) | `300` |
| `sqs_message_retention_seconds` | Retenção de mensagens (segundos) | `1209600` |
| `sqs_delay_seconds` | Delay para entrega (segundos) | `0` |
| `sqs_max_message_size` | Tamanho máximo da mensagem (bytes) | `262144` |

## 📊 Outputs

O Terraform fornece os seguintes outputs:

- URLs e ARNs de todas as filas SQS criadas
- Informações do IAM Role e Policy
- Resumo completo das filas

## 🔒 Segurança

- As filas são criadas com configurações seguras padrão
- IAM Role com permissões mínimas necessárias
- Tags aplicadas a todos os recursos para organização

## 🧹 Limpeza

Para remover todos os recursos criados:

```bash
terraform destroy
```

## 📝 Estrutura de Arquivos

```
infra/terraform/
├── main.tf                    # Recursos principais
├── variables.tf              # Declaração de variáveis
├── outputs.tf               # Outputs do Terraform
├── provider.tf              # Configuração do provider AWS
└── terraform.tfvars.example # Exemplo de variáveis
```

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

