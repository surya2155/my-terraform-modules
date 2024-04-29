
variable "dns_zone_name" {
  type        = string
  description = "(Required) Specifies the name of the Container Registry. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "soa_record" {
  description = "A Start of Authority record details"
  type        = any
  default     = []
}

variable "dns_zone_tags" {
  description = "A Start of Authority record details"
  type        = map(string)
  default     = {}
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network that should be linked to the DNS Zone"
  type        = string
  default     = ""
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Map of tags for the deployment."
  type        = map(string)
  default     = {}

}