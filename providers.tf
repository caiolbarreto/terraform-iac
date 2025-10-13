terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-state-bucket-tf-caio"
    key     = "terraform.tfstate"
    region  = "sa-east-1"
    profile = "caiobarreto"
    encrypt = true
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "caiobarreto"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Iac = true
  }
}

