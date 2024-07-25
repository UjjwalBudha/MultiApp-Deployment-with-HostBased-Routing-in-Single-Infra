variable "region" {
  description = "Region to be used for all the resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "final-project-vpc-ujwal"
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = [ "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24" ]
}

variable "enable_nat_gateway" {
  description = "Enable or disable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
  default     = true
}

variable "ami" {
  description = "ubunntu ami"
  default     = "ami-0a0e5d9c7acc336f1"
}


variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "domain_name" {
  description = "Domain name for routing traffic to the frontend application"
  type        = string
}

variable "domain_name2" {
  description = "Domain name for routing traffic to the frontend application"
  type        = string
}

variable "hosted_zone_id" {
  description = "hosted zone id"
  type        = string
}