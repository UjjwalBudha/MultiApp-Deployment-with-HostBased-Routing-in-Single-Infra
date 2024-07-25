module "frontend-autoscaling_group" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.1.0"

  name                 = "frontend-${var.environment}-${var.project_name}"
  launch_template_name = "frontend-launch-template-${var.environment}-${var.project_name}"

  # Launch template
  image_id             = var.ami
  instance_type        = "t2.medium"
  key_name             = "intern-ujwal"
  network_interfaces = [
      {
        associate_public_ip_address = true
      }
    ]
  

  user_data = base64encode(file("${path.module}/script/frontend.sh"))

  security_groups = [ module.frontend_sg.security_group_id ]

  # Auto Scaling group setting
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  vpc_zone_identifier = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
    target_group_arns = [aws_lb_target_group.frontend_tg.arn]
}