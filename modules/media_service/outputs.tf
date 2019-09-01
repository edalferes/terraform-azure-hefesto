output "media_service_name" {
  value       = "${azurerm_media_services_account.ams.name}"
  description = "Name Azure Media Service"
}

output "media_service_id" {
  value       = "${azurerm_media_services_account.ams.id}"
  description = "ID Azure Media Service"
}