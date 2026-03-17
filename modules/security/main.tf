# =============================================================================
# Edge Security Group
# =============================================================================

resource "cloudru_evolution_security_group" "edge" {
  name        = "${var.name}-edge-sg"
  description = "Security group for edge/NAT server"

  availability_zone {
    id = var.availability_zone_id
  }

  # SSH access from anywhere
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "22:22"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "SSH access"
  }

  # HTTP access from anywhere
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "80:80"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "HTTP access"
  }

  # HTTPS access from anywhere
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "443:443"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "HTTPS access"
  }

  # Allow all traffic from private subnet (for NAT)
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "any"
    port_range       = "any"
    remote_ip_prefix = var.private_cidr
    description      = "All traffic from private subnet"
  }

  # ICMP for diagnostics
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "icmp"
    port_range       = "any"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "ICMP ping"
  }

  # Allow all outbound traffic
  rules {
    direction        = "egress"
    ether_type       = "IPv4"
    ip_protocol      = "any"
    port_range       = "any"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "Allow all outbound traffic"
  }
}

# =============================================================================
# Team VM Security Group
# =============================================================================

resource "cloudru_evolution_security_group" "team" {
  name        = "${var.name}-team-sg"
  description = "Security group for team VMs"

  availability_zone {
    id = var.availability_zone_id
  }

  # SSH access only from edge (public subnet)
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "22:22"
    remote_ip_prefix = var.public_cidr
    description      = "SSH from edge"
  }

  # HTTP access only from edge (for Traefik proxy)
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "80:80"
    remote_ip_prefix = var.public_cidr
    description      = "HTTP from edge"
  }

  # HTTPS access only from edge (for Traefik proxy)
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "tcp"
    port_range       = "443:443"
    remote_ip_prefix = var.public_cidr
    description      = "HTTPS from edge"
  }

  # Allow traffic between team VMs (inter-team via edge)
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "any"
    port_range       = "any"
    remote_ip_prefix = var.private_cidr
    description      = "Inter-team communication"
  }

  # ICMP for diagnostics from edge
  rules {
    direction        = "ingress"
    ether_type       = "IPv4"
    ip_protocol      = "icmp"
    port_range       = "any"
    remote_ip_prefix = var.public_cidr
    description      = "ICMP from edge"
  }

  # Allow all outbound traffic (through NAT)
  rules {
    direction        = "egress"
    ether_type       = "IPv4"
    ip_protocol      = "any"
    port_range       = "any"
    remote_ip_prefix = "0.0.0.0/0"
    description      = "Allow all outbound traffic"
  }
}
