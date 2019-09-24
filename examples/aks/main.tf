module "aks" {
  source = "../../modules/aks"

  aks_name        = "${var.aks_name}"
  resource_group  = "${var.resource_group}"
  location        = "${var.location}"

  virtual_network_name = "${var.virtual_network_name}"
  subnet_name = "${var.subnet_name}"


  admin_user_name = "${var.admin_user_name}"
  public_ssh_key  = "${tls_private_key.my_key.public_key_openssh}"

  kubernetes_client_id     = "${var.kubernetes_client_id}"
  kubernetes_client_secret = "${var.kubernetes_client_secret}"

  tags = "${var.my_tags}"
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

variable "my_tags" {
  type = map(string)
  default = {
    "MAINTAINER"       = "Edmilson Alferes (KIM)"
    "PROJECT"          = "Devops"
    "KM-LOCATION-TEAM" = "Sao_Paulo/BR"
  }
}

