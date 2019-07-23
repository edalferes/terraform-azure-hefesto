variable "name" {
  default     = "test-recource-group"
  description = "Resource group name"
}

variable "location" {
  default     = "East US 2"
  description = "Resource location"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to definition resources"
}