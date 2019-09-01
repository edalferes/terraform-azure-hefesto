variable "prefix" {
  default     = ""
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default     = ""
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "public_ssh_key_path" {
  default     = "~/.ssh/id_rsa.pub"
  description = "The Path at which your Public SSH Key is located. Defaults to ~/.ssh/id_rsa.pub"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource."
}