variable "project-config" {
  description = "Main config"
  type        = map(string)
  default = {
    "region"   = "ap-south-1"
    "profile"  = "unisolve-dev"
    "app-name" = "unisolve-app"
  }
}

provider "aws" {
  region  = var.project-config.region
  profile = var.project-config.profile
}

data "aws_caller_identity" "current" {}

terraform {
  backend "remote" {
    organization = "unisolve-org"
    workspaces {
      name = "unisolve-app"
    }
  }
}
