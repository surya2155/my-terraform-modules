## Azure log analystics workspace outputs

output "az_log_analytics_workspace_id" {
  description = "ID of log analytics workspace"
  value       = azurerm_log_analytics_workspace.az_log_analytics_workspace.workspace_id
}
output "az_log_analytics_workspace_resource_id" {
  description = "Resource ID of log analytics workspace"
  value       = azurerm_log_analytics_workspace.az_log_analytics_workspace.id
}

## Azure log analystics solution outputs

output "az_log_analytics_solution_id" {
  description = "ID of log analytics solution"
  value       = [for x in azurerm_log_analytics_solution.az_log_analytics_solution : x.id]
}

output "az_law_primary_access_key" {
  description = "Log analytics workspace primary Key"
  value       = azurerm_log_analytics_workspace.az_log_analytics_workspace.primary_shared_key
}

output "az_law_secondary_access_key" {
  description = "Log analytics workspace secondary Key"
  value       = azurerm_log_analytics_workspace.az_log_analytics_workspace.secondary_shared_key
}