variable "name" {
  default     = ""
  description = "(Required) The name of the network interface. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the network interface. Changing this forces a new resource to be created."
}


variable "location" {
  default     = ""
  description = "(Required) The location/region where the network interface is created. Changing this forces a new resource to be created."
}

variable "network_security_group_id" {
  default     = ""
  description = "(Optional) The ID of the Network Security Group to associate with the network interface."
}

variable "ip_configuration_name" {
  default     = ""
  description = "(Required) User-defined name of the IP."
}

variable "subnet_id" {
  default     = ""
  description = "(Optional) Reference to a subnet in which this NIC has been created. Required when private_ip_address_version is IPv4."
}

variable "public_ip_address_id" {
  default     = ""
  description = "(Optional) Reference to a Public IP Address to associate with this NIC."
}


variable "private_ip_address_allocation" {
  default     = "Dynamic"
  description = "(Required) Defines how a private IP address is assigned. Options are Static or Dynamic."
}

variable "tags" {
  type    = "map"
  default = {}
}