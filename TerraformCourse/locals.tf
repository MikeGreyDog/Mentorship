locals {
  tags = {
    Project_name = "mentorship_project"
    Environment  = var.environment
    Terraform    = "true"
  }
  application = "${var.environment}-TestApp"
  server_name = "ec2-${var.environment}-${local.application}"
}