variable "name" {
  default     = ""
  description = "(Required) Specifies the prefix name of the virtual machine resource. Changing this forces a new resource to be created."
}

variable "location" {
  default     = ""
  description = "(Required) Specifies the supported Azure Stack Region where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the virtual machine."
}

variable "network_interface_ids" {
  default     = ""
  description = "(Required) Specifies the list of resource IDs for the network interfaces associated with the virtual machine."
}

variable "linux_machine" {
  default = true
  description = "(Required) Enable configuration linux machine."
}

variable "windows_machine" {
  default = false
   description = "(Required) Enable configuration windows machine."
}



variable "vm_size" {
  default     = "Standard_DS1_v2"
  description = "(Required) Specifies the size of the virtual machine."
}

variable "delete_os_disk_on_termination" {
  default     = false
  description = "(Required) Delete the OS disk automatically when deleting the VM"
}

variable "storage_image_reference_publisher" {
  default     = "Canonical"
  description = "(Required, when not using image resource) Specifies the publisher of the image used to create the virtual machine. Changing this forces a new resource to be created."
}

variable "storage_image_reference_offer" {
  default     = "UbuntuServer"
  description = "(Required, when not using image resource) Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created."
}

variable "storage_image_reference_sku" {
  default     = "16.04-LTS"
  description = "(Required, when not using image resource) Specifies the SKU of the image used to create the virtual machine. Changing this forces a new resource to be created."
}

variable "storage_image_reference_version" {
  default     = "latest"
  description = "(Optional) Specifies the version of the image used to create the virtual machine. Changing this forces a new resource to be created."
}

variable "storage_os_disk_name" {
  default     = "os-disc-1"
  description = "(Required) Specifies the disk name."
}

variable "storage_os_disk_caching" {
  default     = "ReadWrite"
  description = "(Required) Specifies the disk name."
}
variable "storage_os_disk_create_option" {
  default     = "FromImage"
  description = "(Required) Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage."
}
variable "storage_os_disk_managed_disk_type" {
  default     = "Standard_LRS"
  description = "(Optional) Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS or Premium_LRS"
}

variable "storage_os_disk_size_gb" {
  default     = "30"
  description = "(Optional) Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS or Premium_LRS"
}

variable "os_profile_computer_name" {
  default     = "my-computer"
  description = "(Required) Specifies the name of the virtual machine."
}

variable "os_profile_admin_username" {
  default     = ""
  description = "(Required) Specifies the name of the administrator account."
}
variable "os_profile_admin_password" {
  default     = ""
  description = "(Required for Windows, Optional for Linux) Specifies the password of the administrator account."
}

variable "os_profile_linux_config_disable_password" {
  default     = true
  description = "(Required) Specifies whether password authentication should be disabled. If set to false, an admin_password must be specified."
}

variable "ssh_keys_data" {
  default     = ""
  description = "(Required) The Public SSH Key which should be written to the path defined above."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}









