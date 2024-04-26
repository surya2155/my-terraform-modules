provider "azurerm" {
  features {}
}


## Azure public ip
module "azure_public_ip" {
  source              = "../../../../../modules/azurerm/AzureNetwork/public_ip"
  public_ip_name      = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address = {
    allocation_method = "Static"
    sku               = "Standard"
  }
  public_ip_tags = merge(
    {
      project = "stage"
    },
    var.common_tags
  )
}



