provider "azurerm" {
  features {}
}

module "network_interface" {
  source                 = "../../../../../modules/azurerm/AzureNetwork/network_interface"
  network_interface_name = var.network_interface_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  network_interface_tags = var.network_interface_tags
  ip_configuration  = var.ip_configuration
}



