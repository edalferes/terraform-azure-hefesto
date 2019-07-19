variable "name" {
  default     = ""
  description = " (Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created."
}

variable "priority" {
  default     = 100
  description = "(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
}

variable "direction" {
  default     = "Inbound"
  description = "(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
}

variable "access" {
  default     = "Allow"
  description = "(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
}

variable "protocol" {
  default     = "Tcp"
  description = "(Required) Network protocol this rule applies to. Possible values include Tcp, Udp or * (which matches both)."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created."
}

variable "network_security_group_name" {
  default     = ""
  description = " (Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."
}

variable "source_port_range" {
  default     = "*"
  description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
}

variable "destination_port_range" {
  default     = "*"
  description = " (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
}

variable "source_address_prefix" {
  default     = "*"
  description = "(Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
}

variable "destination_address_prefix" {
  default     = "*"
  description = "(Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified."
}
