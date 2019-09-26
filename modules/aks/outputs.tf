output "cluster_name" {
  value       = "${azurerm_kubernetes_cluster.aks.name}"
  description = "The Kubernetes Managed Cluster ID."
}

output "cluster_id" {
  value       = "${azurerm_kubernetes_cluster.aks.id}"
  description = "The Kubernetes Managed Cluster ID."
}

output "cluster_fqdn" {
  value       = "${azurerm_kubernetes_cluster.aks.fqdn}"
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
}

output "kube_config" {
  value       = "${azurerm_kubernetes_cluster.aks.kube_config}"
  description = "A kube_config block as defined below."
}

output "kube_config_raw" {
  value       = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
}

output "node_resource_group" {
  value       = "${azurerm_kubernetes_cluster.aks.node_resource_group}"
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}

output "service_principal_id" {
  value = "${azuread_service_principal.aks.application_id}"
}

output "service_principal_password" {
  value = "${random_string.password.result}"
}

output "tenant_id" {
  value = "${data.azurerm_subscription.current.tenant_id}"
}
