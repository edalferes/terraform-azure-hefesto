output "name" {
  value = "${azurerm_resource_group.resource_group.name}"
}

output "location" {
  value = "${azurerm_resource_group.resource_group.location}"
}

output "tags" {
  value = "${azurerm_resource_group.resource_group.tags}"
}
