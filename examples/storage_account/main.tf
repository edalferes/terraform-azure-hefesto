
module "resource_group" {
  source = "../../modules/resource_group"

  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "storage_account" {
  source = "../../modules/storage_account"

  resource_group_name      = "${module.resource_group.name}"
  location                 = "${var.location}"
  storage_account_name     = "${var.storage_account_name}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
  account_kind             = "${var.account_kind}"

  tags = "${var.tags}"
}