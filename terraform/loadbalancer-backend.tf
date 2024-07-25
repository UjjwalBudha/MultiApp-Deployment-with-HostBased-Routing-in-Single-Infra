# resource "aws_lb" "backend_alb" {
#   name               = "backend-alb-${var.environment}"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [ module.backend_sg.security_group_id ]
#   subnets            = module.vpc.public_subnets

#   enable_deletion_protection = false
# }

# resource "aws_lb_target_group" "backend_tg" {
#   name     = "frontend-tg-${var.environment}"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = module.vpc.vpc_id

#   health_check {
#     path                = "/"
#     interval            = 10
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     matcher             = "404"
#   }
# }

# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.frontend_alb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "404: Page not found"
#       status_code  = "404"
#     }
#   }
# }

# resource "aws_lb_listener_rule" "frontend" {
#   listener_arn = aws_lb_listener.http.arn
#   priority     = 1

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.frontend_tg.arn
#   }

#   condition {
#     host_header {
#       values = ["${var.domain_name}"]
#     }
#   }
# }

# resource "aws_lb_listener_rule" "frontend-app2" {
#   listener_arn = aws_lb_listener.http.arn
#   priority     = 2

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.frontend_tg.arn
#   }

#   condition {
#     host_header {
#       values = ["${var.domain_name2}"]
#     }
#   }
# }
