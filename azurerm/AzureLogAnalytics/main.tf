# -
# - Azure log analystics workspace
# -
resource "azurerm_log_analytics_workspace" "az_log_analytics_workspace" {
  name                       = var.log_analytics_workspace
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.log_analytics_workspace_sku
  retention_in_days          = var.log_retention_in_days
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
  tags                       = var.law_tags
}

# -
# - Azure log analystics solution
# -
resource "azurerm_log_analytics_solution" "az_log_analytics_solution" {
  for_each              = var.log_solution_name
  solution_name         = each.value["name"]
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.az_log_analytics_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.az_log_analytics_workspace.name

  dynamic "plan" {
    for_each = each.value["plan"]
    content {
      publisher      = plan.value["publisher"]
      product        = plan.value["product"]
      promotion_code = lookup(plan.value, "promotion_code", null)
    }
  }

  tags = var.las_tags
}
