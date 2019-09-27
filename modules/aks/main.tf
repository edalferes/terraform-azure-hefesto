data "azurerm_subscription" "current" {}


# Generate random string to be used as service principal password
resource "random_string" "password" {
  length  = 32
  special = false
}

# Create Azure AD Application for Service Principal
resource "azuread_application" "aks" {
  name = "${var.aks_name}-sp"
}

# Create Service Principal
resource "azuread_service_principal" "aks" {
  application_id = "${azuread_application.aks.application_id}"
}

# Create Service Principal password
resource "azuread_service_principal_password" "aks" {
  end_date             = "2299-12-30T23:59:00Z" # Forever
  service_principal_id = "${azuread_service_principal.aks.id}"
  value                = "${random_string.password.result}"
}

# Create Resource Group.
module "resource_group" {
  source = "../resource_group"

  name     = "${var.resource_group}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "resource_group_vnet" {
  source = "../resource_group"
  
  name     = "${var.resource_group_vnet}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

# Create Virtual Network (VNet).
module "virtual_network" {
  source = "../virtual_network"

  name                = "${var.virtual_network_name}"
  resource_group_name = "${module.resource_group_vnet.name}"
  location            = "${module.resource_group_vnet.location}"
  address_space       = "${var.virtual_network_address}"
  tags                = "${var.tags}"
}

# Create AKS subnet.
module "subnet" {
  source = "../subnet"

  name                 = "${var.subnet_name}"
  resource_group_name  = "${module.resource_group_vnet.name}"
  address_prefix       = "${var.subnet_address}"
  virtual_network_name = "${module.virtual_network.name}"
}

# Grant AKS cluster access to use AKS subnet
resource "azurerm_role_assignment" "aks" {
  principal_id         = "${azuread_service_principal.aks.id}"
  role_definition_name = "Network Contributor"
  scope                = "${module.subnet.id}"
}


# Create managed Kubernetes cluster (AKS).
resource "azurerm_kubernetes_cluster" "aks" {
  depends_on = ["azuread_application.aks", "azuread_service_principal.aks", "azuread_service_principal_password.aks"]

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
    }
  }

  service_principal {
    client_id     = "${azuread_application.aks.application_id}"
    client_secret = "${azuread_service_principal_password.aks.value}"
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