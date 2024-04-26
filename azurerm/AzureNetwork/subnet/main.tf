# -
# - Subnet
# -
resource "azurerm_subnet" "az_subnet" {
  name                                          = var.subnet_name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.subnet_address_prefix
  service_endpoints                             = var.service_endpoints
  private_endpoint_network_policies_enabled     = var.enforce_private_link
  private_link_service_network_policies_enabled = var.enforce_private_link_service_network_policies

  dynamic "delegation" {
    for_each = var.subnet_delegation
    content {
      name = delegation.key
      dynamic "service_delegation" {
        for_each = toset(delegation.value)
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }
}


# -
# - Subnet nsg association
# -
resource "azurerm_subnet_network_security_group_association" "az_subnet_nsg_association" {
  count                     = var.create_subnet_nsg_association ? 1 : 0
  subnet_id                 = azurerm_subnet.az_subnet.id
  network_security_group_id = var.network_security_group_id
}

# -
# - Subnet route table association
# -
resource "azurerm_subnet_route_table_association" "az_route_table_association" {
  count          = var.create_subnet_routetable_association ? 1 : 0
  subnet_id      = azurerm_subnet.az_subnet.id
  route_table_id = var.route_table_id
}


# -
# -  subnet Nat gateway  association
# -

resource "azurerm_subnet_nat_gateway_association" "az_nat_gateway_sub_association" {
  count          = var.create_subnet_nat_gateway_association ? 1 : 0
  subnet_id      = azurerm_subnet.az_subnet.id
  nat_gateway_id = var.nat_gateway_id
}





