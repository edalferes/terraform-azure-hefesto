variable "location" {
  default     = "East US 2"
  description = "(Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = " (Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
}

variable "aks_name" {
  default     = "aks-cluster"
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}

variable "aks_dns_prefix" {
  default     = "akscluster"
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
}

variable "aks_client_id" {
  default     = ""
  description = "(Required) The Client ID for the Service Principal. Changing this forces a new resource to be created."
}

variable "aks_client_secrets" {
  default     = ""
  description = "(Required) The Client Secret for the Service Principal. Changing this forces a new resource to be created."
}

variable "node_pool_main" {
  type = "map"
  default = {
      "name" = "main"
      "count" = 1
      "vm_size" = "Standard_D1_v2"
      "os_type" = "Linux"
      "os_disk_size_gb" = "30"
  }
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}