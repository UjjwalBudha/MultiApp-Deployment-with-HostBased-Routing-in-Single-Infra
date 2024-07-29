module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.8.0"

  identifier = "database-${var.environment}-${var.project_name}"

  engine            = "mysql"
  engine_version    = "8.0.35"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "products"
  username = "ujwal"
  password = "ujwal123"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.db_sg.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [
    module.vpc.private_subnets[4],
    module.vpc.private_subnets[5]
  ]

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  deletion_protection = false

  skip_final_snapshot = true

  
}
