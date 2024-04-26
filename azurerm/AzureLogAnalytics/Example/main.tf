provider "azurerm" {
  features {}
}
# azure proximity placement groups
module "proximity_placement_group" {
  source                         = "../../../../../modules/azurerm/AzureCompute/proximity_placement_group"
  for_each                       = var.proximity_placement_group_settings
  proximity_placement_group_name = each.value["proximity_placement_group_name"]
  location                       = var.location
  resource_group_name            = var.resource_group_name
  placement_group_tags = merge(
    {
      project = "stage"
    },
    var.common_tags,
  )
}