variable "name" {
  description = "Base name for security groups"
  type        = string
}

variable "public_cidr" {
  description = "CIDR block of the public subnet (edge VM network)"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block of the private subnet (team VMs network)"
  type        = string
}

variable "availability_zone_id" {
  description = "Availability zone ID for security groups"
  type        = string
}
