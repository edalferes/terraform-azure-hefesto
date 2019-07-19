output "id" {
  value       = "${azurerm_public_ip.public_ip.id}"
  description = "The Public IP ID."
}

output "ip_address" {
  value       = "${azurerm_public_ip.public_ip.ip_address}"
  description = "The IP address value that was allocated."
}

