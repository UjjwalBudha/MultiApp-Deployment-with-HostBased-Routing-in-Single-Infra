output "backend-autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  value       = module.backend-autoscaling_group.autoscaling_group_name
}

output "frontend-autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  value       = module.frontend-autoscaling_group.autoscaling_group_name
}
