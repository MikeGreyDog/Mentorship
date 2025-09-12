output "public_ip" {
  description = "Public IP address of deployed EC2 server"
  value       = aws_instance.web2.public_ip
}
output "public_dns" {
  description = "Public DNS name of deployed EC2 server"
  value       = aws_instance.web2.public_dns
}