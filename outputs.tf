output "wireguard_ip" {
  description = "Public IP address of the WireGuard server."
  value       = module.wireguard_vm.public_ip
}

output "ssh_private_key" {
  description = "The private SSH key for accessing the Lightsail instance."
  value       = module.wireguard_vm.ssh_private_key
  sensitive   = true
}

output "ssh_public_key" {
  description = "The public SSH key for accessing the Lightsail instance."
  value       = module.wireguard_vm.ssh_public_key
}



output "server_ip" {
  description = "Public IP address of the WireGuard server instance."
  value       = module.wireguard_vm.server_ip
}
