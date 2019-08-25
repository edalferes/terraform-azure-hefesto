variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "prefix" {
  default     = ""
  description = "A prefix used for all resources in this example"
}

variable "resource_group" {
  default     = ""
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription."
}

variable "location" {
  default     = ""
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "admin_user_name" {
  default     = ""
  description = "(Required) The Admin Username for the Cluster. Changing this forces a new resource to be created."
}

variable "public_ssh_key" {
  default     = ""
  description = " (Required) An ssh_key block. Only one is currently allowed. Changing this forces a new resource to be created."
}

variable "node_size" {
  default     = "Standard_DS2_v2"
  description = "(Required) The size of each VM in the Agent Pool (e.g. Standard_DS2_v2). Changing this forces a new resource to be created."
}

variable "enable_auto_scaling" {
  type        = bool
  default     = true
  description = " (Required) Whether to enable auto-scaler."
}

variable "node_min_count" {
  default     = 3
  description = "(Required) Minimum number of nodes for auto-scaling"
}

variable "node_max_count" {
  default     = 10
  description = "(Required) Maximum number of nodes for auto-scaling"
}

variable "max_pods" {
  default     = 110
  description = "(Required) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
}

variable "virtual_network_address" {
  default     = "10.1.0.0/16"
  description = ""
}

variable "subnet_address" {
  default     = "10.1.0.0/16"
  description = ""
}

variable "dns_service_ip" {
  default     = "10.0.0.10"
  description = "(Required) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "docker_bridge_cidr" {
  default     = "172.17.0.1/16"
  description = "(Required) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "pod_cidr" {
  default     = "10.244.0.0/16"
  description = "(Required) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
}

variable "service_cidr" {
  default     = "10.0.0.0/16"
  description = "(Required) The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Required) A mapping of tags to assign to the resource."
}