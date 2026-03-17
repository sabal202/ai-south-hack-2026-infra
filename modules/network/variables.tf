variable "public_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone_id" {
  description = "Cloud.ru Evolution availability zone ID"
  type        = string
}

variable "project_name" {
  description = "Project name used as prefix for resource names"
  type        = string
  default     = "aicamp"
}
