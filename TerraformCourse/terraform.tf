terraform {
  backend "s3" {
    bucket = "my-terraform-state-mikegd"
    key    = "prod/aws_infra"
    region = "us-west-2"
  }
  required_version = ">=1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0"
    }
  }
}