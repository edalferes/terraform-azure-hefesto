
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
  #tags     = "${var.tags}"
}

resource "azurerm_storage_account" "st" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  #tags                     = "${var.tags}"
}

resource "azurerm_media_services_account" "ams" {
  name                = "${var.prefix}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"

  storage_account {
    id         = "${azurerm_storage_account.st.id}"
    is_primary = true
  }
}