variable "ec2_instance_type" {
  description = "instance type for web-server"
  type        = string
  default     = "t2.micro"
}
variable "ami" {}
variable "subnet_id" {}
variable "security_groups" {
  type = list(any)
}
variable "keyname" {}
variable "private_key" {}
variable "private_key_location" {}