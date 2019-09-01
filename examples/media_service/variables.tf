variable "prefix" {
  default = "trfmediaservicetest"
}

variable "resource_group_name" {
  default = "trf-mediaservice-test"
}

variable "location" {
  default = "East US 2"
}

variable "storage_account_name" {
  default = "trfmediaservicetest"
}

variable "tags" {
  type = "map"
  default = {
    "MAINTAINER"       = "Edmilson Alferes (KIM)"
    "PROJECT"          = "Devops"
    "KM-LOCATION-TEAM" = "Sao_Paulo/BR"
  }
}