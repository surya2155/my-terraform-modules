provider "azurerm" {
  features {}
}


## Azure network security group
module "network_security_group" {
  source              = "../../../../../modules/azurerm/AzureNetwork/network_security_group_new"
  location            = var.location
  security_group_name = var.security_group_name
  resource_group_name = var.resource_group_name

  nsg_tags = merge(
    {
      project = "stage"
    },
    var.common_tags
  )

  security_rules = {
  }
}