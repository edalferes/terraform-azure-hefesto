output "id" {
  value = "${azurerm_virtual_machine.virtual_machine.id}"
  description = "The ID of the Virtual Machine."
}

output "admin_username" {
  value = "${azurerm_virtual_machine.virtual_machine.admin_username}"
  description = "The name of the administrator account."
}