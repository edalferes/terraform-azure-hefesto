output "this_resource_group_name" {
  value = "${module.resource_group.name}"
}

output "this_location" {
  value = "${azurerm_resource_group.resource_group.location}"
}

output "this_tags" {
  value = "${azurerm_resource_group.resource_group.tags}"
}