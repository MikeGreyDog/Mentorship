locals {
  tags = {
    Project_name = "mentorship_project"
    Environment  = "dev"
    Terraform    = "true"
  }
  application = "TestApp"
  server_name = "ec2-${var.environment}-${local.application}"
}