resource "aws_db_instance" "rds_instance" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name  # Correct argument
  username             = var.username
  password             = var.password
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot  = true

  tags = {
    Name        = var.db_name
    Environment = var.environment
  }
}

