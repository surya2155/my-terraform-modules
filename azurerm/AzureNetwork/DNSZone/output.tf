## Private DNS zone outputs
output "az_private_dns_id" {
  value       = azurerm_private_dns_zone.az_private_dns.id
  description = "The Private DNS Zone ID."
}
output "az_private_dns_name" {
  value       = azurerm_private_dns_zone.az_private_dns.name
  description = " The fully qualified domain name of the Record Set."
}
output "az_private_dns_number_of_record_sets" {
  value       = azurerm_private_dns_zone.az_private_dns.number_of_record_sets
  description = "The Private DNS Zone ID."
}
