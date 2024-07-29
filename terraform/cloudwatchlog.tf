module "cloudwatch_log_group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "~> 3.0"
  name              = "cloudwatch-log-${var.environment}-${var.project_name}"
  retention_in_days = 120
}