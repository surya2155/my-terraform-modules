# -
# - Container
# -
resource "azurerm_storage_container" "az_storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
}