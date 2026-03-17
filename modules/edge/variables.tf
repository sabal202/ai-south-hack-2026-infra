variable "flavor_id" {
  description = "Compute flavor ID (looked up via data source in environment)"
  type        = string
}

variable "disk_type_id" {
  description = "Boot disk type ID (looked up via data source in environment)"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "availability_zone_id" {
  description = "Availability zone ID for the floating IP"
  type        = string
}

variable "availability_zone_name" {
  description = "Availability zone name for the compute instance"
  type        = string
  default     = "ru.AZ-1"
}

variable "public_subnet_name" {
  description = "Name of the public subnet for the external interface"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of the private subnet for the internal/gateway interface"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID applied to both interfaces"
  type        = string
}

variable "user_name" {
  description = "Username for SSH access on the edge VM"
  type        = string
  default     = "jump"
}

variable "public_key" {
  description = "SSH public key for admin access"
  type        = string
}

variable "private_ip" {
  description = "Static IP on the private interface (default gateway for team VMs)"
  type        = string
  default     = "10.0.2.1"
}
