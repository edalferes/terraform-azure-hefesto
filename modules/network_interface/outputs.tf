output "id" {
  value       = "${azurerm_network_interface.network_interface.id}"
  description = "The Virtual Network Interface ID."
}

output "private_ip_address" {
  value       = "${azurerm_network_interface.network_interface.private_ip_address}"
  description = "The first private IP address of the network interface."
}