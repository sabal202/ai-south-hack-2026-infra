variable "teams" {
  description = "Map of team configurations keyed by team ID"
  type = map(object({
    user        = string
    public_keys = list(string)
    ip          = string
  }))
}

variable "flavor_id" {
  description = "Cloud.ru Evolution flavor ID for the VM"
  type        = string
}

variable "disk_type_id" {
  description = "Cloud.ru Evolution disk type ID"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 65
}

variable "availability_zone_name" {
  description = "Cloud.ru Evolution availability zone"
  type        = string
  default     = "ru.AZ-1"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}


variable "security_group_id" {
  description = "ID of the security group for team VMs"
  type        = string
}

variable "team_public_keys" {
  description = "SSH public key per team, keyed by team ID"
  type        = map(string)
}
