provider "aws" {
  region  = var.m3_regionName
   
}


module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"
  name                   = var.name
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  tags                   = var.tags
}

variable "name" {
  type        = string
  description = "Name instance"
}

variable "ami" {
  type        = string
  description = "ID of AMI to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with"
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to launch in"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
}
variable "m3_regionName" {
  description = "The AWS region to deploy"
  type        = string
}

output "pass"  {
value = var.m3ae_pass
}

output "autopass" {
value = var.m3a_auto_password
}
output "hiddenpass" {
value = var.m3he_password
}
output "autohidden" {
value = var.m3ah_autohidden
}
output "autopasswordemail" {
value = var.m3ahe_autopasswordemail
}
output "hidden" {
value = var.m3h_pgp_key
}
output "mname" {
value = var.m3u_name
}

variable "m3ah_autohidden" {
  type        = string
  description = "Username" 
}
variable "m3u_name" {
  type        = string
  description = "Username" 
}
variable "m3h_pgp_key" {
  type        = string
  description = "PGP key used to encrypt sensitive data for this user (if empty - secrets are not encrypted)" 
}
variable "m3ae_pass" {
  type        = string
  description = "Password reset required" 
}
variable "m3he_password" {
  type        = string
  description = "Upload iam user ssh key" 
}
variable "m3a_auto_password" {
  type        = string
  description = "Force destroy user" 
}
variable "m3ahe_autopasswordemail" {
  type        = string
  description = "Ssh public key" 
}
