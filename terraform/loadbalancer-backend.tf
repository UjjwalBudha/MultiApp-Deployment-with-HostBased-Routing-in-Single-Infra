resource "aws_lb" "backend_alb" {
  name               = "backend-alb-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ module.backend_sg.security_group_id ]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "backend_tg1" {
  name     = "backend1-tg-${var.environment}"
  port     = 8081
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path                = "/"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "404"
  }
}

resource "aws_lb_target_group" "backend_tg2" {
  name     = "backend2-tg-${var.environment}"
  port     = 8082
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path                = "/"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "404"
  }
}

resource "aws_lb_listener" "http_backend" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Page not found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "backend_rule1" {
  listener_arn = aws_lb_listener.http_backend.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg1.arn
  }

  condition {
    path_pattern {
      values = ["/products"]
    }
  }
}

resource "aws_lb_listener_rule" "backend_rule2" {
  listener_arn = aws_lb_listener.http_backend.arn
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg2.arn
  }

  condition {
    path_pattern {
      values = ["/products01"]
    }
  }
}
