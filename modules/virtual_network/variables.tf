variable "name" {
  default     = ""
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "location" {
  default     = ""
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "address_space" {
  default     = "10.0.0.0/23"
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}

variable "tags" {
  type    = "map"
  default = {}
}
