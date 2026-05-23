# DevOps Assignment

## Overview
This project contains Terraform infrastructure code and a Python janitor script.

## Technologies Used
- Terraform
- Python
- boto3
- LocalStack
- GitHub

## Terraform Resources
- S3 Bucket
- VPC
- Security Group

## Janitor Script
The janitor script generates a JSON report for unused cloud resources.

## How to Run

### Terraform
terraform init

terraform apply

### Python Script
cd janitor

python janitor.py

## Output
The Python script generates:
- report.json

## Notes
- LocalStack used instead of real AWS
- SSH access included only for assignment/demo purposes