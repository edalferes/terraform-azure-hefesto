resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name}"
  location            = "${azurerm_resource_group.resource_group.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  dns_prefix          = "${var.aks_dns_prefix}"

  agent_pool_profile {
    name            = "${var.node_pool_main["name"]}"
    count           = "${var.node_pool_main["count"]}"
    vm_size         = "${var.node_pool_main["vm_size"]}"
    os_type         = "${var.node_pool_main["os_type"]}"
    os_disk_size_gb = "${var.node_pool_main["os_disk_size_gb"]}"
  }

  service_principal {
    client_id     = "${var.aks_client_id}"
    client_secret = "${var.aks_client_secrets}"
  }

  tags = "${var.tags}"
}