output "dns_service_ip" {
  value = "${azurerm_kubernetes_cluster.aks.network_profile.0.dns_service_ip}"
}
