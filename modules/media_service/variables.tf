variable "prefix" {
  default     = ""
  description = "(Required) Specifies the name of the Media Services Account. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the Media Services Account. Changing this forces a new resource to be created."
}

variable "location" {
  default     = "East US 2"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "storage_account_name" {
  default     = ""
  description = "(Required) One or more storage_account blocks as defined below."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to definition resources"
}