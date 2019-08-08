resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
  
  tags = "${var.tags}"
}

resource "azurerm_automation_account" "automation_account" {
  name                = "${var.automation_account_name}"
  location            = "${azurerm_resource_group.resource_group.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  sku_name = "Basic"

  tags = "${var.tags}"
}

resource "azurerm_automation_credential" "automation_credential" {
  name                = "${var.credencial_name}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  account_name        = "${azurerm_automation_account.automation_account.name}"
  username            = "${var.credencial_user_name}"
  password            = "${var.credencial_user_password}"
}

data "local_file" "this" {
  filename = "${path.module}/start_stop.ps1"
}

resource "azurerm_automation_runbook" "start_stop_runbook" {

  count = var.runbook_enable ? 1 : 0

  name                = "${var.automation_runbook_name}"
  location            = "${azurerm_resource_group.resource_group.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  account_name        = "${azurerm_automation_account.automation_account.name}"
  log_verbose         = "${var.runbook_log_verbose}"
  log_progress        = "${var.runbook_log_progress}"
  description         = "${var.runbook_description}"
  runbook_type        = "${var.runbook_type}"

  publish_content_link {
    uri = "${var.publish_content_link_uri}"
  }

  content = "${data.local_file.this.content}"

  tags = "${var.tags}"
}