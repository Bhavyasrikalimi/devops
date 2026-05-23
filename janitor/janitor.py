import json
from datetime import datetime

findings = []

# Example orphan EBS volume
findings.append({
    "resource_id": "vol-123456",
    "resource_type": "ebs_volume",
    "reason": "unattached",
    "age_days": 21,
    "estimated_monthly_cost_usd": 10.0,
    "tags": {
        "Project": None,
        "Environment": None
    },
    "suggested_action": "delete",
    "safe_to_auto_delete": False
})

# Example stopped EC2 instance
findings.append({
    "resource_id": "i-123456",
    "resource_type": "ec2_instance",
    "reason": "stopped for more than 14 days",
    "age_days": 18,
    "estimated_monthly_cost_usd": 15.0,
    "tags": {
        "Project": "NimbusKart",
        "Environment": "staging"
    },
    "suggested_action": "review",
    "safe_to_auto_delete": False
})

report = {
    "scan_timestamp": datetime.utcnow().isoformat() + "Z",
    "account_id": "000000000000",
    "region": "us-east-1",
    "summary": {
        "total_orphans": len(findings),
        "estimated_monthly_waste_usd": 25.0
    },
    "findings": findings
}

with open("report.json", "w") as f:
    json.dump(report, f, indent=4)

print("Report generated successfully!")

# Exit non-zero if orphans found
if len(findings) > 0:
    exit(1)