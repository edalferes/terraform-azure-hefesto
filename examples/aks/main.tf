# Configure modules
module "aks" {
  source = "../../modules/aks"

  resource_group_name = "aks-test"
  aks_name = "aks-test-terraform"
  aks_dns_prefix = "aks-test-terraform"
  node_pool_main = "${var.node_pool_main}"
  aks_client_id = "${var.aks_client_id}"
  aks_client_secrets = "${var.aks_client_secrets}"
  tags = "${var.tags}"
}