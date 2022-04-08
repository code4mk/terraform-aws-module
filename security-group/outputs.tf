output "security_group" {
  value = aws_security_group.this
}

output "security_group_id" {
  value = aws_security_group.this.id
}