module "backend-autoscaling_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name            = "backend-alarm-${var.environment}-${var.project_name}"
  comparison_operator   = "GreaterThanOrEqualToThreshold"
  evaluation_periods    = "2"
  threshold             = 70
  period                = "60"
  unit                  = "Percent"
  namespace             = "AWS/EC2"
  metric_name           = "CPUUtilization"
  statistic             = "Average"

  alarm_actions = [
    module.sns_topic.topic_arn
  ]

  dimensions = {
    AutoScalingGroupName = module.backend-autoscaling_group.autoscaling_group_name
  }
}

module "frontend-autoscaling_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name            = "frontend-alarm-${var.environment}-${var.project_name}"
  comparison_operator   = "GreaterThanOrEqualToThreshold"
  evaluation_periods    = "2"
  threshold             = 70
  period                = "60"
  unit                  = "Percent"
  namespace             = "AWS/EC2"
  metric_name           = "CPUUtilization"
  statistic             = "Average"

  alarm_actions = [
    module.sns_topic.topic_arn
  ]

  dimensions = {
    AutoScalingGroupName = module.frontend-autoscaling_group.autoscaling_group_name
  }
}