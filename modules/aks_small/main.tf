resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  address_space       = ["${var.virtual_network_address}"]

  tags = "${var.tags}"
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.subnet_address}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks"
  location            = "${azurerm_resource_group.rg.location}"
  dns_prefix          = "${var.prefix}-aks"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  linux_profile {
    admin_username = "${var.admin_user_name}"

    ssh_key {
      key_data = "${var.public_ssh_key}"
    }
  }

  agent_pool_profile {
    name                = "main"
    count               = "${var.node_min_count}"
    vm_size             = "${var.node_size}"
    os_type             = "Linux"
    os_disk_size_gb     = 30
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = "${var.enable_auto_scaling}"
    min_count           = "${var.node_min_count}"
    max_count           = "${var.node_max_count}"
    max_pods            = "${var.max_pods}"

    # Required for advanced networking
    vnet_subnet_id = "${azurerm_subnet.subnet.id}"
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = "${var.dns_service_ip}"
    docker_bridge_cidr = "${var.docker_bridge_cidr}"
    pod_cidr           = "${var.pod_cidr}"
    service_cidr       = "${var.service_cidr}"
  }

  tags = "${var.tags}"
}