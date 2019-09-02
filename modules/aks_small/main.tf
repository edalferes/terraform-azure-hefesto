<<<<<<< HEAD
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}"
=======
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
>>>>>>> fa6cf08004087fe5dbaa4d40ba76363f6c44694d
  location = "${var.location}"
  tags     = "${var.tags}"
}

<<<<<<< HEAD
resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.1.0.0/16"]
=======
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  address_space       = ["${var.virtual_network_address}"]
>>>>>>> fa6cf08004087fe5dbaa4d40ba76363f6c44694d

  tags = "${var.tags}"
}

<<<<<<< HEAD
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.prefix}-aks"
  location            = "${azurerm_resource_group.example.location}"
  dns_prefix          = "${var.prefix}-aks"
  resource_group_name = "${azurerm_resource_group.example.name}"

  linux_profile {
    admin_username = "acctestuser1"

    ssh_key {
      key_data = "${file(var.public_ssh_key_path)}"
=======
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
>>>>>>> fa6cf08004087fe5dbaa4d40ba76363f6c44694d
    }
  }

  agent_pool_profile {
<<<<<<< HEAD
    name                = "agentpool"
    count               = "2"
    vm_size             = "Standard_DS2_v2"
    os_type             = "Linux"
    os_disk_size_gb     = 30
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3

    # Required for advanced networking
    vnet_subnet_id = "${azurerm_subnet.example.id}"
=======
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
>>>>>>> fa6cf08004087fe5dbaa4d40ba76363f6c44694d
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }
<<<<<<< HEAD

  tags = "${var.tags}"
=======
>>>>>>> fa6cf08004087fe5dbaa4d40ba76363f6c44694d

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = "${var.dns_service_ip}"
    docker_bridge_cidr = "${var.docker_bridge_cidr}"
    pod_cidr           = "${var.pod_cidr}"
    service_cidr       = "${var.service_cidr}"
  }

  tags = "${var.tags}"
}