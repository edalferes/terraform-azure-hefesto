variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable "location" {
  default     = "East US 2"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "storage_account_name" {
  description = " (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "account_tier" {
  default     = "Standard"
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "account_replication_type" {
  default     = "LRS"
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}