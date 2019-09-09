module "resource_group" {
  source = "../resource_group"

  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${module.resource_group.name}"
  location                 = "${module.resource_group.location}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"

  tags = "${var.tags}"
}