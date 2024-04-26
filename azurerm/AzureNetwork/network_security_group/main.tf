# -
# - Network security group
# -
resource "azurerm_network_security_group" "az_network_security_group" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.nsg_tags
}

# -
# - Network security group rules
# -
resource "azurerm_network_security_rule" "allow-in" {
  for_each                                   = var.security_rules
  name                                       = each.value["name"]
  description                                = lookup(each.value, "description", null)
  protocol                                   = coalesce(each.value["protocol"], "Tcp")
  direction                                  = each.value["direction"]
  access                                     = coalesce(each.value["access"], "Allow")
  priority                                   = each.value["priority"]
  source_address_prefix                      = lookup(each.value, "source_address_prefix", null)
  source_address_prefixes                    = lookup(each.value, "source_address_prefixes", null)
  destination_address_prefix                 = lookup(each.value, "destination_address_prefix", null)
  destination_address_prefixes               = lookup(each.value, "destination_address_prefixes", null)
  source_port_range                          = lookup(each.value, "source_port_range", null)
  source_port_ranges                         = lookup(each.value, "source_port_ranges", null)
  destination_port_range                     = lookup(each.value, "destination_port_range", null)
  destination_port_ranges                    = lookup(each.value, "destination_port_ranges", null)
  source_application_security_group_ids      = lookup(each.value, "source_application_security_group_ids", null)
  destination_application_security_group_ids = lookup(each.value, "destination_application_security_group_ids", null)
  resource_group_name                        = var.resource_group_name
  network_security_group_name                = azurerm_network_security_group.az_network_security_group.name
}