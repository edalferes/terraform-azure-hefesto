
variable "subscription_id" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}

variable "tenant_id" {
  default = ""
}

variable "location" {
  default = "East US 2"
}

variable "resource_group_name" {
  default = ""
}

variable "virtual_network_name" {
  default = ""
}

variable "address_space" {
  default = ""
}

variable "subnet_name" {
  default = ""
}

variable "address_prefix" {
  default = ""
}

variable "security_group_name" {
  default = ""
}

variable "security_rule_name" {
  default = ""
}

variable "tags" {
  type = "map"
  default = {
    "MY_VALUE"      = "VALUE"
  }
}
