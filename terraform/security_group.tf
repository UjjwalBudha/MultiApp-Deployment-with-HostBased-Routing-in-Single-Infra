module "frontend_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"


  name        = "frontend-sg-${local.environment}-${local.project_name}"
  description = "Security group for web server with SSH port open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3001
      to_port     = 3001
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_rules = ["all-all"]
}


module "backend_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "backend-sg-${local.environment}-${local.project_name}"
  description = "Security group for backend with SSH port open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8082
      to_port     = 8082
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3001
      to_port     = 3001
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_rules = ["all-all"]
}

module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "database-sg-${local.environment}-${local.project_name}"
  description = "Security group for backend with SSH port open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_rules = ["all-all"]
}