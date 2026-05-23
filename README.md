# DevOps Assignment

## Overview

This project implements a Terraform-based AWS infrastructure setup and a Python-based Cost Janitor automation tool for detecting orphaned cloud resources in a LocalStack environment.

---

## How to run locally

```bash
git clone <your-repo-url>

cd devops-assignment

docker run --rm -d -p 4566:4566 --name localstack localstack/localstack:3.0

cd terraform

terraform init

terraform apply
```

Run the janitor script:

```bash
cd ../janitor

pip install -r requirements.txt

python janitor.py
```

---

## Architecture

```text
Terraform -> LocalStack -> Mock AWS Resources
                     |
                     v
               Janitor Script
                     |
                     v
                report.json
```

---

## Decisions & deviations

- Used LocalStack instead of real AWS to avoid cloud costs.
- Port 22 access from 0.0.0.0/0 is insecure in production, but retained because the assignment requested it.
- Simplified orphan detection logic due to LocalStack limitations for some AWS services.
- Added sample findings to demonstrate report schema compliance.

---

## Trade-offs

With one more week, I would:
- Fully modularize Terraform resources.
- Add complete EC2 and Elastic IP orphan detection using boto3.
- Improve CI/CD workflow with PR comments and artifact uploads.
- Add automated Terraform validation and formatting checks.
- Add unit tests for janitor logic.

---

## AI usage disclosure

- Used ChatGPT for Terraform debugging, LocalStack troubleshooting, and improving README structure.
- One issue suggested by AI was repeatedly debugging LocalStack instead of simplifying the implementation; I noticed this was wasting time and shifted focus toward assignment compliance.
- The overall repository structure adjustments and final documentation organization were completed manually to better match the assignment specification.