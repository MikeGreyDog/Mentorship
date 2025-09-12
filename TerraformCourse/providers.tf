# Configure the AWS Provider
provider "aws" {
  version = "~> 6.0"
  region  = var.aws_region
  default_tags {
    tags = local.tags
  }
}