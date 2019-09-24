variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "aks_name" {
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}

variable "resource_group" {
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription."
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "admin_user_name" {
  description = "(Required) The Admin Username for the Cluster. Changing this forces a new resource to be created."
}

variable "public_ssh_key" {
  description = " (Required) An ssh_key block. Only one is currently allowed. Changing this forces a new resource to be created."
}

variable "node_pool" {
  type = list(map(string))
  default = [
    {
      name                = "main"
      count               = "3"
      vm_size             = "Standard_DS2_v2"
      os_type             = "Linux"
      os_disk_size_gb     = 30
      type                = "VirtualMachineScaleSets"
      enable_auto_scaling = true
      min_count           = "1"
      max_count           = "10"
      max_pods            = "110"
    },
  ]
}

variable "virtual_network_name" {
  description = " (Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "virtual_network_address" {
  default     = "10.1.0.0/16"
  description = ""
}

variable "subnet_name" {
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "subnet_address" {
  default     = "10.1.0.0/16"
  description = "(Required) The address prefix to use for the subnet."
}

variable "dns_service_ip" {
  default     = "10.0.0.10"
  description = "(Required) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "docker_bridge_cidr" {
  default     = "172.17.0.1/16"
  description = "(Required) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "pod_cidr" {
  default     = "10.244.0.0/16"
  description = "(Required) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
}

variable "service_cidr" {
  default     = "10.0.0.0/16"
  description = "(Required) The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Required) A mapping of tags to assign to the resource."
}