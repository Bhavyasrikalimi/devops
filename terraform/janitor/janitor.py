import json

findings = []

unused_volume = {
    "resource_type": "EBS_VOLUME",
    "resource_id": "vol-123456",
    "reason": "Volume is unattached",
    "estimated_monthly_savings_usd": 10
}

findings.append(unused_volume)

with open("report.json", "w") as f:
    json.dump(findings, f, indent=4)

print("Report generated: report.json")