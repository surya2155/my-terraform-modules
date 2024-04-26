
## need to add additional nodepool block
module "kubernetes_cluster" {
  source                  = "../modules/azurerm/AzureContainer/kubernetes_cluster"
  kubernetes_cluster_name = var.kubernetes_cluster_name
  location                = module.rg.az_resource_group_location
  resource_group_name     = module.rg.az_resource_group_name
  kubernetes_version      = var.kubernetes_version
  k8s_default_pool        = var.k8s_default_pool
  k8s_tags                = var.k8s_tags
  aks_dns_prefix_name     = var.aks_dns_prefix_name
}
