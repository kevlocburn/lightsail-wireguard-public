output "public_ip" {
  description = "Public IP of the Lightsail instance."
  value       = aws_lightsail_static_ip.static_ip.ip_address
}

output "ssh_private_key" {
  description = "The private SSH key for the Lightsail instance."
  value       = tls_private_key.lightsail_key.private_key_pem
}

output "ssh_public_key" {
  description = "The public SSH key for the Lightsail instance."
  value       = tls_private_key.lightsail_key.public_key_openssh
}

output "server_ip" {
  description = "Public IP address of the WireGuard server."
  value       = aws_lightsail_static_ip.static_ip.ip_address
}
