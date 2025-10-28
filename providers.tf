terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-state-bucket-tf-caio-us-east-1"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "caiobarreto"
    encrypt = true
  }
}

provider "aws" {
  region  = "us-east-1"
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

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.terraform_state]
}

