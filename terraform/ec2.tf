module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = "Jump_Server_ujwal"

  instance_type               = "t2.micro"
  ami                         = var.ami
  key_name                    = "intern-ujwal"
  monitoring                  = true
  vpc_security_group_ids      = [module.backend_sg.security_group_id]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true
}


module "ec2_instance_frontend01" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

name                 = "frontend-${var.environment}-${var.project_name}-01"

  instance_type               = "t2.medium"
  ami                         = var.ami
  key_name                    = "intern-ujwal"
  monitoring                  = true
  vpc_security_group_ids      = [module.backend_sg.security_group_id]
  subnet_id                   = element(module.vpc.private_subnets, 0)
  # associate_public_ip_address = true
  user_data = base64encode(file("/home/ujwal/adex/final-project-internship/terraform/script/frontend.sh"))
  

}



module "ec2_instance_backend01" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

name                 = "backend-${var.environment}-${var.project_name}-01"

  instance_type               = "t2.micro"
  ami                         = var.ami
  key_name                    = "intern-ujwal"
  monitoring                  = true
  vpc_security_group_ids      = [module.backend_sg.security_group_id]
  subnet_id                   = element(module.vpc.private_subnets, 2)
  # associate_public_ip_address = true
  user_data = base64encode(file("/home/ujwal/adex/final-project-internship/terraform/script/backend.sh"))

}


# resource "aws_lb_target_group_attachment" "frontend_instance" {
#   target_group_arn = aws_lb_target_group.frontend_tg.arn
#   target_id        = aws_lb_target_group.frontend_tg.id
#   port             = 80
# }

