variable "ami" {}
variable "size" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "security_groups" {
  type = list(any)
}
variable "environment" {
  description = "Environment. QA and PROD values should be set by TF_VAR_environment environment variable"
  type        = string

}