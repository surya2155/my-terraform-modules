## storage container outputs

output "az_storage_container_id" {
  description = "The ID of the Storage Container"
  value       = azurerm_storage_container.az_storage_container.id
}


output "az_storage_resource_manager_id" {
  description = "The ID of the Storage Container"
  value       = azurerm_storage_container.az_storage_container.resource_manager_id
}