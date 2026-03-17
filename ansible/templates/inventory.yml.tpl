all:
  children:
    edge:
      hosts:
        edge-vm:
          ansible_host: ${edge_public_ip}
          ansible_user: ${edge_user}
          private_ip: ${edge_private_ip}
          edge_public_ip: ${edge_public_ip}
    team_vms:
      hosts:
%{ for id, team in teams ~}
        team-${id}:
          ansible_host: ${team.private_ip}
          ansible_user: ${team.user}
          team_id: "${id}"
%{ endfor ~}
      vars:
        ansible_ssh_common_args: '-o ProxyJump=${edge_user}@${edge_public_ip}'
