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
  type = "map"
  default = {
    "MAINTAINER"       = "Edmilson Alferes (KIM)"
  }
}