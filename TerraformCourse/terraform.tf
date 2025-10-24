terraform {
  /*
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "tf-test-mtitko"
    workspaces {
      name = "mentorship-cli"
    }
  }
  */
  backend "s3" {
    bucket         = "my-terraform-state-mikegd"
    key            = "dev/aws_infra"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
  required_version = ">=1.12.0"
  required_providers {
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