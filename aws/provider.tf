
# Acesso ao Amazon Web Services
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region  = "us-east-1" 
  default_tags {
    tags = {
      source = "TERRAFORM"
      product = "LAB"
      managed = "IAC"
      environment = "DEV"
      cost_center = "1122334455"
    }
  }
}