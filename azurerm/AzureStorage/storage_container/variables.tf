
# Container common vars

variable "storage_container_name" {
  description = "Name of containers, if it contains illegal characters (,-_ etc) those will be truncated."
  type        = string
  default     = ""
}

variable "storage_account_name" {
  description = "The name of the Storage Account where the Container should be created"
  type        = string
  default     = ""
}

variable "container_access_type" {
  description = "the Access Level configured for this Container. Possible values are blob, container or private"
  type        = string
  default     = "private"
}



# containers vars
# variable "containers" {
#   type = map(object({
#     name                  = string
#     storage_account_name  = string
#     container_access_type = string
#   }))
#   description = "Map of Storage Containers"
#   default     = {}
# }