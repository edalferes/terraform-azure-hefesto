resource "azurerm_public_ip" "public_ip" {
  name                         = "${var.name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  allocation_method            = "${var.allocation_method}"
  domain_name_label            = "${var.domain_name_label}"

  tags = "${var.tags}"
}