output "vpc_id" {
  value = aws_vpc.main.id
}

output "bucket_name" {
  value = "bhavs-test-bucket"
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}