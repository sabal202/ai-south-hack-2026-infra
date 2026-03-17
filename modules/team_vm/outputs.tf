output "instances" {
  description = "Map of team VM instances with id, private_ip, and user"
  value = {
    for id, instance in cloudru_evolution_compute.team : id => {
      id         = instance.id
      private_ip = local.team_ips[id]
      user       = var.teams[id].user
    }
  }
}

output "team_ips" {
  description = "Map of static IPs assigned to each team VM"
  value       = local.team_ips
}
