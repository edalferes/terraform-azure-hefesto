# Configure modules
module "media_service" {
  source = "../../modules/media_service"

  prefix               = "${var.prefix}"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
  #tags                 = "${var.tags}"
}