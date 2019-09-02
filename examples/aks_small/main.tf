module "aks_small" {
  source = "../../modules/aks_small"

  prefix          = "terraform-aks-small"
  resource_group  = "terraform-aks-small"
  location        = "eastus2"
  admin_user_name = "aks-user"
  public_ssh_key  = "${file("~/.ssh/id_rsa.pub")}"


  kubernetes_client_id     = "10d468f3-edb9-455b-a1e2-d24a35a55932"
  kubernetes_client_secret = "4c313ab8-6c28-47fd-9eff-aabe43178e1e"

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
