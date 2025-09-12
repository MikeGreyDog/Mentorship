output "public_subnet_addrs" {
  description = "Cidr blocks of public subnets"
  value       = { for k, v in aws_subnet.public_subnets : k => v.cidr_block }
}
output "private_subnet_addrs" {
  description = "Cidr blocks of private subnets"
  value       = { for k, v in aws_subnet.private_subnets : k => v.cidr_block }
}
output "db_subnet_addrs" {
  description = "Cidr blocks of db subnets"
  value       = { for k, v in aws_subnet.db_subnets : k => v.cidr_block }
}
output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = { for k, v in aws_subnet.public_subnets : k => v.id }
}
output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = { for k, v in aws_subnet.private_subnets : k => v.id }
}
output "db_subnet_ids" {
  description = "IDs of db subnets"
  value       = { for k, v in aws_subnet.db_subnets : k => v.id }
}
output "vpc_id" {
  description = "Output ID of VPC"
  value       = aws_vpc.vpc.id
}