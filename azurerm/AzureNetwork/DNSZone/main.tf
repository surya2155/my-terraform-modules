# -
# - Private DNS Zone
# -

resource "azurerm_private_dns_zone" "az_private_dns" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ## need to check with new version of terraform
  dynamic "soa_record" {
    for_each = var.soa_record

    content {
      email        = lookup(soa_record.value, "email", null)
      expire_time  = lookup(soa_record.value, "expire_time", null)
      minimum_ttl  = lookup(soa_record.value, "minimum_ttl", null)
      refresh_time = lookup(soa_record.value, "refresh_time", null)
      ttl          = lookup(soa_record.value, "ttl", null)
      tags         = var.tags
    }
  }

  tags = var.dns_zone_tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "az_private_dns_zone_vnet_link" {
  name                  = "vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.az_private_dns.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = var.registration_enabled
  tags                  = var.tags
}

