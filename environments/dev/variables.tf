# =============================================================================
# Cloud.ru Evolution Configuration
# =============================================================================

variable "project_id" {
  description = "Cloud.ru Evolution project ID"
  type        = string
}

variable "auth_key_id" {
  description = "Cloud.ru service account API key ID"
  type        = string
  sensitive   = true
}

variable "auth_secret" {
  description = "Cloud.ru service account API secret"
  type        = string
  sensitive   = true
}

variable "availability_zone_name" {
  description = "Cloud.ru Evolution availability zone name"
  type        = string
  default     = "ru.AZ-1"
}

# =============================================================================
# Network Configuration
# =============================================================================

variable "public_cidr" {
  description = "CIDR block for public subnet (edge/NAT)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_cidr" {
  description = "CIDR block for private subnet (team VMs)"
  type        = string
  default     = "10.0.2.0/24"
}

# =============================================================================
# Project Configuration
# =============================================================================

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "aicamp"
}

variable "domain" {
  description = "Base domain for the camp"
  type        = string
  default     = "south.aitalenthub.ru"
}

# =============================================================================
# Edge VM Configuration
# =============================================================================

variable "edge_cores" {
  description = "Number of CPU cores for edge VM"
  type        = number
  default     = 2
}

variable "edge_memory" {
  description = "Memory in GB for edge VM"
  type        = number
  default     = 4
}

variable "edge_disk_size" {
  description = "Boot disk size in GB for edge VM"
  type        = number
  default     = 20
}

variable "jump_user" {
  description = "Username for jump host access"
  type        = string
  default     = "jump"
}

variable "jump_public_key" {
  description = "SSH public key for jump host user"
  type        = string
}

# =============================================================================
# Team VM Configuration
# =============================================================================

variable "team_cores" {
  description = "Number of CPU cores for team VMs"
  type        = number
  default     = 4
}

variable "team_memory" {
  description = "Memory in GB for team VMs"
  type        = number
  default     = 8
}

variable "team_disk_size" {
  description = "Boot disk size in GB for team VMs"
  type        = number
  default     = 65
}

variable "teams" {
  description = "Map of teams with their configuration"
  type = map(object({
    user        = string
    public_keys = list(string)
    ip          = string
  }))
  default = {}
}

# =============================================================================
# Xray/VLESS Configuration
# =============================================================================

variable "vless_server" {
  description = "VLESS proxy server address (hostname)"
  type        = string
  default     = ""
}

variable "vless_server_ip" {
  description = "VLESS server IP address (excluded from TPROXY to avoid loop)"
  type        = string
  default     = ""
}

variable "vless_port" {
  description = "VLESS proxy server port"
  type        = number
  default     = 443
}

variable "vless_uuid" {
  description = "VLESS UUID for authentication"
  type        = string
  default     = ""
  sensitive   = true
}

variable "vless_sni" {
  description = "VLESS Reality SNI (serverName)"
  type        = string
  default     = ""
}

variable "vless_fingerprint" {
  description = "VLESS Reality browser fingerprint"
  type        = string
  default     = "chrome"
}

variable "vless_public_key" {
  description = "VLESS Reality public key"
  type        = string
  default     = ""
  sensitive   = true
}

variable "vless_short_id" {
  description = "VLESS Reality short ID"
  type        = string
  default     = ""
  sensitive   = true
}
