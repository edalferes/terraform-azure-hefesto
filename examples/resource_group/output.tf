output "resource_group_name" {
  value = "${module.resource_group.name}"
  description = "Resource group name"
}

output "location" {
  value = "${azurerm_resource_group.resource_group.location}"
  description = "Resource location"
}

output "tags" {
  value = "${azurerm_resource_group.resource_group.tags}"
  description = "Tags to definition resources"
}