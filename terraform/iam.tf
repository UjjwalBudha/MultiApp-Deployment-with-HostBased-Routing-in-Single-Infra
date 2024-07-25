# module "ssm_role" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

#   name = "ssm-role-${var.environment}-${var.project_name}"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })

#   custom_role_policies = [
#     {
#       name        = "SSMFullAccessPolicy"
#       description = "Policy for SSM full access"
#       policy      = jsonencode({
#         Version = "2012-10-17"
#         Statement = [
#           {
#             Effect   = "Allow"
#             Action   = "ssm:*"
#             Resource = "*"
#           }
#         ]
#       })
#     }
#   ]
# }

