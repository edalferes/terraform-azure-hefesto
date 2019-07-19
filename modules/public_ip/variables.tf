variable "name" {
  default     = ""
  description = "(Required) Specifies the name of the Public IP resource . Changing this forces a new resource to be created."
}

variable "location" {
  default     = ""
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the public ip."
}

variable "public_ip_address_allocation" {
  default     = "Static"
  description = "(Required) Defines whether the IP address is static or dynamic. Options are Static or Dynamic."
}

variable "domain_name_label" {
  default     = "Static"
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
}

variable "tags" {
  type    = "map"
  default = {}
}


