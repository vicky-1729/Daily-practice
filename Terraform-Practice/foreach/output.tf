# Output all EC2 instance details created via for_each
output "details" {
  value = aws_instance.test_server
}