# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "~> 3.0"

#   zone_name = keys(module.zones.route53_zone_zone_id)[0]

#   records = [
#     {
#       name    = "apigateway1"
#       type    = "A"
#       alias   = {
#         name    = mod
#         zone_id = var.hosted_zone_id
#       }
#     },
#     {
#       name    = ""
#       type    = "A"
#       ttl     = 3600
#       records = [
#         "10.10.10.10",
#       ]
#     },
#   ]

# }