# Design Document

## Objective

The goal of this project is to build a lightweight cloud cost janitor system capable of identifying orphaned AWS resources and generating reports for cost optimization.

---

## Infrastructure Design

Terraform is used to provision AWS-style infrastructure resources using LocalStack for local testing.

Resources included:
- S3 Bucket
- VPC
- Security Group

The infrastructure includes mandatory tagging:
- Project
- Environment
- Owner
- ManagedBy

---

## Janitor Design

The janitor script scans cloud resources and identifies potentially unused resources.

Current implemented detection logic:
- Unattached EBS volumes
- Stopped EC2 instances

The script generates:
- JSON report output
- Estimated monthly waste
- Suggested cleanup actions

---

## Safety Considerations

The janitor currently runs in dry-run mode only.

No automatic deletion is performed.

Resources marked:
```json
"safe_to_auto_delete": false
```

require manual review before cleanup.

---

## Architecture Flow

```text
Terraform Resources
        |
        v
LocalStack AWS Emulator
        |
        v
Python Janitor Script
        |
        v
report.json
```

---

## Scalability Considerations

With additional development time:
- Multi-region scanning could be added.
- Parallel boto3 scanning could improve performance.
- Resource data could be stored in DynamoDB or PostgreSQL.
- GitHub Actions could upload reports as artifacts.

---

## Limitations

- LocalStack does not fully emulate all AWS services reliably.
- Simplified orphan detection logic used for assignment demonstration.
- Terraform modules are partially implemented due to time constraints.

---

## Future Improvements

- Full Terraform modularization
- Automated cleanup approvals
- Slack/email notifications
- Tag compliance enforcement
- Cost Explorer integration
- Unit and integration testing