resource "azurerm_subnet" "subnet" {
  name                      = "${var.name}"
  resource_group_name       = "${var.resource_group_name}"
  virtual_network_name      = "${var.virtual_network_name}"
  address_prefix            = "${var.address_prefix}"
  network_security_group_id = "${var.network_security_group_id}"
}