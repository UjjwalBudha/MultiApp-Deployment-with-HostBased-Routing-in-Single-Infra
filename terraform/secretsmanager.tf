

module "secrets_manager" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "1.1.2"

  # Secret
  name_prefix             = "secret-manager-${var.environment}-${var.project_name}"
  description             = "secret manager to store rds credentials"
  recovery_window_in_days = 30

  # Policy
  create_policy       = true
  block_public_policy = true
  policy_statements = {
    read = {
      sid = "AllowAccountRead"
      principals = [{
        type        = "AWS"
        identifiers = ["arn:aws:iam::426857564226:root"]
      }]
      actions   = ["secretsmanager:GetSecretValue"]
      resources = ["*"]
    }
  }


  secret_string = jsonencode({
    host    = split(":", module.db.db_instance_endpoint)[0]
    dbname  = var.db_name
    dbname1 = var.db_name1
  })
}
