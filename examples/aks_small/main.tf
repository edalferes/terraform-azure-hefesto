module "aks_small" {
  source = "../../modules/aks_small"

  prefix                   = "terraform-aks-small"
  location                 = "East US 2"
  kubernetes_client_id     = ""
  kubernetes_client_secret = ""

  tags = "${var.tags}"

}

variable "tags" {
  type = "map"
  default = {
    "MAINTAINER"       = "Edmilson Alferes (KIM)"
    "PROJECT"          = "Devops"
    "KM-LOCATION-TEAM" = "Sao_Paulo/BR"
  }
}
