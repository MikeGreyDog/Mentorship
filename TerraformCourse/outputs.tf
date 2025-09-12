output "hello-world" {
  description = "Print Hello WOrld"
  value       = "Hello World"
}
output "public_url" {
  description = "Public URL of Web Server"
  value       = module.web-server.public_url
}
output "module_server_public_ip" {
  description = "Public IP address of deployed EC2 server"
  value       = module.server.public_ip
}
output "module_server_public_dns" {
  description = "Public DNS name of deployed EC2 server"
  value       = module.server.public_dns
}
output "s3_bucket_name" {
  description = "Name of deployed AWS S3 bucket"
  value       = module.s3-bucket.s3_bucket_bucket_domain_name
}
output "public_subnet_addrs" {
  description = "Cidr blocks of public subnets"
  value       = module.vpc.public_subnet_addrs
}
output "private_subnet_addrs" {
  description = "Cidr blocks of private subnets"
  value       = module.vpc.private_subnet_addrs
}
output "db_subnet_addrs" {
  description = "Cidr blocks of db subnets"
  value       = module.vpc.db_subnet_addrs
}
output "vpc_id" {
  description = "Output ID of VPC"
  value       = "Your ${var.environment} VPC has ID: ${module.vpc.vpc_id}"
}