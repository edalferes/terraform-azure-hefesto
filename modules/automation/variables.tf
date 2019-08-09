variable "automation_account_name" {
  default     = ""
  description = "(Required) Specifies the name of the Automation Account. Changing this forces a new resource to be created."
}

variable "location" {
  default     = "East US 2"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created."
}

variable "credencial_name" {
  default     = "credencial_main"
  description = "(Required) Specifies the name of the Credential. Changing this forces a new resource to be created."
}

variable "credencial_user_name" {
  default     = "user_main"
  description = "(Required) The username associated with this Automation Credential."
}

variable "credencial_user_password" {
  default     = "2NgGAJud"
  description = "(Required) The password associated with this Automation Credential."
}

variable "runbook_enable" {
  type        = bool
  default     = false
  description = "(Required) Enable/Disable create runbool."
}


variable "automation_runbook_name" {
  default     = "Start_Stop_VM"
  description = "(Required) Specifies the name of the Runbook. Changing this forces a new resource to be created."
}

variable "runbook_log_verbose" {
  default     = "true"
  description = " (Required) Verbose log option."
}

variable "runbook_log_progress" {
  default     = "true"
  description = "(Required) Progress log option."
}

variable "runbook_description" {
  default     = "This use for Start and Stop Virtual Machines"
  description = "(Optional) A description for this runbook."
}

variable "runbook_type" {
  default     = "PowerShell"
  description = "(Required) The type of the runbook - can be either Graph, GraphPowerShell, GraphPowerShellWorkflow, PowerShellWorkflow, PowerShell or Script."
}

variable "publish_content_link_uri" {
  default     = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
  description = "(Required) The uri of the runbook content."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}