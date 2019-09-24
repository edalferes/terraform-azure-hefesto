output "cluster_id" {
  value       = "${module.aks.cluster_id}"
  description = "The Kubernetes Managed Cluster ID."
}

output "cluster_fqdn" {
  value       = "${module.aks.cluster_fqdn}"
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
}

output "node_resource_group" {
  value       = "${module.aks.node_resource_group}"
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}