output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = cloudru_evolution_subnet.public.id
}

output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = cloudru_evolution_subnet.public.name
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = cloudru_evolution_subnet.private.id
}

output "private_subnet_name" {
  description = "Name of the private subnet"
  value       = cloudru_evolution_subnet.private.name
}

output "public_cidr" {
  description = "CIDR block of the public subnet"
  value       = var.public_cidr
}

output "private_cidr" {
  description = "CIDR block of the private subnet"
  value       = var.private_cidr
}
