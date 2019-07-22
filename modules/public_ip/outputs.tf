output "id" {
  value       = "${azurerm_public_ip.public_ip.id}"
  description = "The Public IP ID."
}

output "ip_address" {
  value       = "${azurerm_public_ip.public_ip.ip_address}"
  description = "The IP address value that was allocated."
}

output "fqdn" {
  value       = "${azurerm_public_ip.public_ip.fqdn}"
  description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}