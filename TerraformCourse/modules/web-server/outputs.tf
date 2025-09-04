output "public_url" {
  description = "Public URL of Web Server"
  value       = "http://${aws_instance.web.public_ip}:80/index.html"
}