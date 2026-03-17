# =============================================================================
# Public Subnet (for Edge/NAT VM)
# =============================================================================

resource "cloudru_evolution_subnet" "public" {
  name            = "${var.project_name}-public"
  subnet_address  = var.public_cidr
  default_gateway = cidrhost(var.public_cidr, 1)
  routed_network  = true

  availability_zone {
    id = var.availability_zone_id
  }
}

# =============================================================================
# Private Subnet (for Team VMs)
# =============================================================================

resource "cloudru_evolution_subnet" "private" {
  name            = "${var.project_name}-private"
  subnet_address  = var.private_cidr
  default_gateway = cidrhost(var.private_cidr, 1)

  availability_zone {
    id = var.availability_zone_id
  }
}
