module "resource_group" {
  source = "../resource_group"

  name     = "${var.resource_group}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "virtual_network" {
  source = "../virtual_network"

  name                = "${var.virtual_network_name}"
  resource_group_name = "${module.resource_group.name}"
  location            = "${module.resource_group.location}"
  address_space       = "${var.virtual_network_address}"
  tags                = "${var.tags}"

}

module "subnet" {
  source = "../subnet"

  name                 = "${var.subnet_name}"
  resource_group_name  = "${module.resource_group.name}"
  address_prefix       = "${var.subnet_address}"
  virtual_network_name = "${module.virtual_network.name}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name}"
  location            = "${module.resource_group.location}"
  dns_prefix          = "${var.aks_name}"
  resource_group_name = "${module.resource_group.name}"

  linux_profile {
    admin_username = "${var.admin_user_name}"

    ssh_key {
      key_data = "${var.public_ssh_key}"
    }
  }

  dynamic "agent_pool_profile" {
    for_each = var.node_pool
    content {
      name                = agent_pool_profile.value["name"]
      count               = agent_pool_profile.value["count"]
      vm_size             = agent_pool_profile.value["vm_size"]
      os_type             = agent_pool_profile.value["os_type"]
      os_disk_size_gb     = agent_pool_profile.value["os_disk_size_gb"]
      type                = agent_pool_profile.value["type"]
      enable_auto_scaling = agent_pool_profile.value["enable_auto_scaling"]
      min_count           = agent_pool_profile.value["min_count"]
      max_count           = agent_pool_profile.value["max_count"]
      max_pods            = agent_pool_profile.value["max_pods"]

      # Required for advanced networking
      #vnet_subnet_id = "${module.subnet.id}"
    }
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  network_profile {
    network_plugin     = "kubenet"
    dns_service_ip     = "${var.dns_service_ip}"
    docker_bridge_cidr = "${var.docker_bridge_cidr}"
    pod_cidr           = "${var.pod_cidr}"
    service_cidr       = "${var.service_cidr}"
  }

  tags = "${var.tags}"
}