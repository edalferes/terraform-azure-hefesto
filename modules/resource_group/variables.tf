variable "name" {
  default     = ""
  description = "Recource group name"
}

variable "location" {
  default     = ""
  description = "resource location"
}

variable "tags" {
  type    = "map"
  default = {}
  description = "Tags to definition resources"
}