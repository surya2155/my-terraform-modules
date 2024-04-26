provider "azurerm" {
  features {}
}

# azure subnet
module "subnet" {
  source                        = "../../../../../modules/azurerm/AzureNetwork/subnet"
  subnet_name                   = var.subnet_name
  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.virtual_network_name
  subnet_address_prefix         = var.subnet_address_prefix
  service_endpoints             = var.service_endpoints
  subnet_delegation             = var.subnet_delegation
}