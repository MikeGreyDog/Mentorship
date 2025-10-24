variable "aws_region" {
  type    = string
  default = "us-west-2"
  validation {
    condition     = can(regex("us-.*$", var.aws_region))
    error_message = "Only US AWS regions can be used"
  }
}
variable "ec2_instance_type" {
  description = "instance type for web-server"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = contains(["t2.micro", "t4g.small"], var.ec2_instance_type)
    error_message = "Allowed instance types: t2.micro, t4g.small"
  }
}
variable "environment" {
  description = "Environment. QA and PROD values should be set by TF_VAR_environment environment variable"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Allowed values: dev, qa, prod. Value should be set by TF_VAR_environment environment variable"
  }
}
variable "ports" {
  type = map(number)
  default = {
    ssh   = 22
    http  = 80
    https = 443
  }
}