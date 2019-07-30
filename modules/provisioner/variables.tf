variable "source_file" {
  default     = ""
  description = "(Required) source file to copy VM."
}

variable "destination_file" {
  default     = ""
  description = "(Required) destination file to copy VM."
}

variable "connection_host" {
  default     = ""
  description = "(Required) The address of the resource to connect to."
}

variable "connection_user" {
  default     = ""
  description = "(Required) User to connection to use provisioner."
}
variable "connection_agent" {
  default     = false
  description = " (Required) Set to false to disable using ssh-agent to authenticate"
}

variable "connection_timeout" {
  default     = "1m"
  description = "(Required) Timeout connection provisioner."
}

variable "connection_private_key" {
  default     = ""
  description = "(Required) Provate key connection provisioner."
}

variable "remote_exec_list" {
  type        = "list"
  default     = []
  description = "This is a list of command strings."
}