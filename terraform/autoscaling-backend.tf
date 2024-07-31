module "backend-autoscaling_group" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.1.0"

  name                 = "backend-${var.environment}-${var.project_name}"
  launch_template_name = "backend-launch-template-${var.environment}-${var.project_name}"

  # Launch template
  image_id                 = var.ami-backend
  instance_type            = var.instance_small
  iam_instance_profile_arn = aws_iam_instance_profile.ssm_instance_profile.arn



  user_data = base64encode(file("${path.module}/script/backend.sh"))

  security_groups = [module.backend_sg.security_group_id]

  # Auto Scaling group setting
  desired_capacity = 2
  min_size         = 1
  max_size         = 3
  vpc_zone_identifier = [
    module.vpc.private_subnets[2],
    module.vpc.private_subnets[3]
  ]
  target_group_arns = [
    aws_lb_target_group.backend_tg1.arn,
    aws_lb_target_group.backend_tg2.arn
  ]

}