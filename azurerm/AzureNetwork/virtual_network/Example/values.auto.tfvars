
## virtual network common tfvars
resource_group_name = "resource_group_name"
location            = "westeurope"

virtual_network_name = "test-vnet-test"
vnet_address_space   = ["10.20.0.0/16"]

## common tags
common_tags = {
  cost_center = "eurofins_it"
}