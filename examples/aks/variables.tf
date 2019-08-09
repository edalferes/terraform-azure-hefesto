variable "aks_client_id" {
  default     = "10d468f3-edb9-455b-a1e2-d24a35a55932"
  description = "(Required) The Client ID for the Service Principal. Changing this forces a new resource to be created."
}

variable "aks_client_secrets" {
  default     = "4c313ab8-6c28-47fd-9eff-aabe43178e1e"
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
  type = "map"
  default = {
    "MAINTAINER"       = "Edmilson Alferes (KIM)"
  }
}