provider "azurerm" {
  features {}
}


## Azure 
module "virtual_network" {
  source               = "../../../../../modules/azurerm/AzureNetwork/virtual_network"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  vnet_address_space   = var.vnet_address_space
  location                  = var.location
  vnet_tags            =  merge(
    {
      project = "stage"
    },
    var.common_tags
  )
}



