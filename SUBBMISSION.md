# Submission Notes

## Completed
- Terraform project setup
- AWS provider configuration
- S3 bucket resource
- VPC resource
- Security Group resource
- Resource tagging
- GitHub repository setup
- Python janitor script
- JSON report generation

## Local Testing
- LocalStack used for AWS emulation
- Terraform successfully initialized
- S3 bucket resource creation tested successfully
- Python janitor script tested successfully

## Challenges Faced
- LocalStack compatibility issues with some AWS services
- Terraform state synchronization issues during local testing

## Assumptions
- LocalStack used instead of real AWS to avoid cloud costs
- Simplified janitor logic implemented for demonstration purposes

## Future Improvements
- Add full EC2 support
- Improve janitor detection logic
- Add GitHub Actions CI/CD pipeline
- Modularize Terraform configuration