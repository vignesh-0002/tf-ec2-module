variable "cidr" {
    type = string
}

variable "name" {
  type    = string
}

variable "environment" {
  type    = string 
}


variable "tags" {
  type = map(string)
  default = {
    Created_by = "vignesh"
  }
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
}

variable "Public_sn_cidr" {
  type         = string
}

variable "Private_sn_cidr_1" {
  type         = string
}

variable "Private_sn_cidr_2" {
  type         = string
}

variable "database_sn_cidr" {
  type         = string
}

variable "create-eip" {
  type         = bool
}

variable "public_subnet_az" {
  type         = string
}

variable "private_subnet_az_2" {
  type         = string
}


variable "public_rt_cidr" {
  type = string
}

variable "Private_rt_cidr" {
  type = string
}

variable "database_rt_cidr" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "subnet_grp_name" {
  type    = string
}

variable "keypair-name"{
  type = string
}

variable "Dynamodb_name" {
  type = string
}

variable "s3-bucket-name" {
  type = string
}

variable "iam-role-name" {
  type = string
}

variable "iam-instance-profile-name" {
  type = string
}