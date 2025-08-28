output "hello-world" {
  description = "Print Hello WOrld"
  value       = "Hello World"
}
output "subnet_addrs" {
  value = module.subnet_addrs.network_cidr_blocks
}
output "vpc_id" {
  description = "Output ID of VPC"
  value       = "Your ${aws_vpc.vpc.tags.Environment} VPC has ID: ${aws_vpc.vpc.id}"
}
output "public_url" {
  description = "Public URL of Web Server"
  value       = "http://${aws_instance.web.public_ip}:80/index.html"
}