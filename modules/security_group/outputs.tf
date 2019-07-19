output "id" {
  value = "${azurerm_network_security_group.security_group.id}"
}

output "name" {
  value = "${azurerm_network_security_group.security_group.name}"
}

output "resource_group_name" {
  value = "${azurerm_network_security_group.security_group.resource_group_name}"
}

output "location" {
  value = "${azurerm_network_security_group.security_group.location}"
}

output "tags" {
  value = "${azurerm_network_security_group.security_group.tags}"
}