module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "ujwal"  
      type    = "A"
      alias   = {
        name    = aws_lb.frontend_alb.dns_name
        zone_id = aws_lb.frontend_alb.zone_id
      }
    },
    {
      name    = "budha"  
      type    = "A"
      alias   = {
        name    = aws_lb.frontend_alb.dns_name
        zone_id = aws_lb.frontend_alb.zone_id
      }
    }
  ]
}