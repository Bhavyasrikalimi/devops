# Walkthrough

## Step 1 — Clone Repository

```bash
git clone <your-repo-url>
```

---

## Step 2 — Start LocalStack

```bash
docker run --rm -d -p 4566:4566 --name localstack localstack/localstack:3.0
```

Verify:

```bash
docker ps
```

---

## Step 3 — Initialize Terraform

```bash
cd terraform

terraform init
```

---

## Step 4 — Apply Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Resources configured:
- S3 Bucket
- VPC
- Security Group

---

## Step 5 — Run Janitor Script

```bash
cd ../janitor

pip install -r requirements.txt

python janitor.py
```

---

## Step 6 — Generated Report

Generated file:

```text
report.json
```

Sample output is also available in:

```text
samples/report.example.json
```

---

## Notes

- LocalStack used instead of real AWS to avoid cloud charges.
- Some AWS services behave differently in LocalStack compared to real AWS.
- The implementation focuses on assignment compliance and demonstration.