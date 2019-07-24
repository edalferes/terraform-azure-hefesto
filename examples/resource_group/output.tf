output "name" {
  value       = "${module.resource_group.name}"
  description = "Resource group name"
}

output "location" {
  value       = "${module.resource_group.location}"
  description = "Resource location"
}

output "tags" {
  value       = "${module.resource_group.tags}"
  description = "Tags to definition resources"
}