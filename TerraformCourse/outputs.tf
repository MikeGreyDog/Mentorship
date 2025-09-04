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
  value       = module.web-server.public_url
}
output "module_server_public_ip" {
  value = module.server.public_ip
}
output "module_server_public_dns" {
  value = module.server.public_dns
}
output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_bucket_domain_name
}