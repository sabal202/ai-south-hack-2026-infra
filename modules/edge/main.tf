# =============================================================================
# Floating IP for Edge VM
# =============================================================================

resource "cloudru_evolution_fip" "edge" {
  name = "south-edge-fip"

  availability_zone {
    id = var.availability_zone_id
  }
}

# =============================================================================
# Edge VM Instance (dual-homed: public + private subnets)
# =============================================================================

resource "cloudru_evolution_compute" "edge" {
  name      = "south-edge"
  flavor_id = var.flavor_id

  availability_zone {
    name = var.availability_zone_name
  }

  image {
    name       = "ubuntu-22.04"
    host_name  = "south-edge"
    user_name  = var.user_name
    public_key = var.public_key
  }

  boot_disk {
    name = "south-edge-boot"
    size = var.disk_size

    disk_type {
      id = var.disk_type_id
    }
  }

  # Public subnet interface (with FIP)
  network_interfaces {
    subnet {
      name = var.public_subnet_name
    }

    security_groups {
      id = var.security_group_id
    }

    fip {
      id = cloudru_evolution_fip.edge.id
    }
  }

  # Private subnet interface (gateway for team VMs)
  network_interfaces {
    subnet {
      name = var.private_subnet_name
    }

    security_groups {
      id = var.security_group_id
    }

    ip_address = var.private_ip
  }
}
