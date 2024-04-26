kubernetes_cluster_name = "test_01"

k8s_default_pool = {
  name                = "pool1"
  count               = 3
  vm_size             = "Standard_D2s_v3"
  os_disk_size_gb     = 50
  type                = "VirtualMachineScaleSets"
  vnet_subnet_id      = "/subscriptions/7c3c220d-7c78-4f67-96f3-7a38317a906d/resourceGroups/test-rg-manya/providers/Microsoft.Network/virtualNetworks/test-vnet/subnets/default"
  max_pods            = 30
  availability_zones  = [1, 2, 3]
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 3
}


k8s_tags = {
  Name        = "terraform-demo-vent"
  Environment = "Dev"
}
