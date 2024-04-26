module "azure-containers" {
  source                 = "../modules/azurerm/AzureStorage/storage_container"
  storage_container_name = var.storage_container_name
  storage_account_name   = module.storage_account.az_storage_account_name
  container_access_type  = var.container_access_type
}

