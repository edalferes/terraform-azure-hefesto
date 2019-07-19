output "resource_group_name" {
  value = "${module.resource_group.name}"
}

output "location_resource_group" {
  value = "${module.resource_group.location}"
}

output "virtual_network_name" {
  value = "${module.virtual_network.name}"
}

output "virtual_network_resource_group" {
  value = "${module.virtual_network.resource_group_name}"
}

output "virtual_network_location" {
  value = "${module.virtual_network.location}"
}

output "virtual_network_address_space" {
  value = "${module.virtual_network.address_space}"
}

output "resource_group_tags" {
  value = "${module.resource_group.tags}"
}
