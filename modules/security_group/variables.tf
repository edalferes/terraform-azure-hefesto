variable "name" {
  default     = ""
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = " (Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}

variable "location" {
  default     = ""
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}
