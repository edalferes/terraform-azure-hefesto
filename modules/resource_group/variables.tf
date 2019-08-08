variable "name" {
  default     = ""
  description = "Recource group name"
}

variable "location" {
  default     = "East US 2"
  description = "resource location"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to definition resources"
}