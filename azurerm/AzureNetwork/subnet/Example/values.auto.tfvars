#Subnet tfvars
subnet_name = "test-subnet"
resource_group_name = "resource_group_name"
virtual_network_name = "virtual_network_name"
subnet_address_prefix = ["172.24.10.0/24"]
service_endpoints     = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Web"]
subnet_delegation = {
  app-service-plan = [
    {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  ]
}

