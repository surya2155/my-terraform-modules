## kubernetes cluster common vars
variable "kubernetes_cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create."
  type        = string
  default     = ""
}

variable "aks_dns_prefix_name" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = "test"
}

variable "k8s_tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

# linux_profile config vars
variable "linux_profile" {
  description = "Username and ssh key for accessing Linux machines with ssh."
  type        = object({ username = string, ssh_key = string })
  default     = null
}

variable "k8s_default_pool" {
  description = "default node pool"
  type        = object(any)
  default     = null
}


