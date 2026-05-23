terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  s3_use_path_style = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

 resource "aws_s3_bucket" "test" {
  bucket = "bhavs-test-bucket"

  tags = {
   Project     = var.project
    Environment = var.environment
    Owner       = "Bhavya"
    ManagedBy   = "terraform"
  }
 }

resource "aws_vpc" "main" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Project     = var.project
    Environment = var.environment
    Owner       = "Bhavya"
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = var.project
    Environment = var.environment
    Owner       = "Bhavya"
    ManagedBy   = "terraform"
  }
}