## Storage account variables

variable "storage_account_name" {
  description = "Name of storage account, if it contains illegal characters (,-_ etc) those will be truncated."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure location where resources should be deployed."
  type        = string
  default     = ""
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
  default     = "LRS"
}


variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled"
  type        = bool
  default     = true
}


variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account"
  type        = string
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  description = "Allow or disallow public access to all blobs or containers in the storage account."
  type        = bool
  default     = false
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow public access to all nested items in the storage account."
  type        = bool
  default     = false
}

variable "is_hns_enabled" {
  description = "Azure Data Lake Storage Gen 2"
  type        = bool
  default     = false
}

variable "large_file_share_enabled" {
  description = "enable Large File Share"
  type        = bool
  default     = false
}

variable "blob_properties" {
  type    = any
  default = {}
}

variable "assign_identity" {
  description = "enable system-assigned managed identity"
  type        = string
  default     = "SystemAssigned"
}

variable "soft_delete_retention" {
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  #type        = number
  default = null
}

variable "cors_rule" {
  description = "CORS rules for storage account."
  type = list(object({
    allowed_origins    = list(string),
    allowed_methods    = list(string),
    allowed_headers    = list(string),
    exposed_headers    = list(string),
    max_age_in_seconds = number
  }))
  default = []
}

variable "custom_domain" {
  description = "custom domain for storage account"
  type        = list(map(string))
  default     = []
}

variable "network_rules" {
  description = "default_action - (Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow. bypass - (Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None. ip_rules - (Optional) List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed. virtual_network_subnet_ids - (Optional) A list of resource ids for subnets."
  type = list(object({
    default_action             = string
    bypass                     = list(string)
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
}


variable "static_website" {
  description = "static website for storage account"
  type        = list(map(string))
  default     = []
}

variable "storage_account_tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
}


variable "queue_properties" {
  type = map(object({
    cors_rule = list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = string
    }))
    logging = list(object({
      delete                = string
      read                  = string
      write                 = string
      version               = string
      retention_policy_days = string
    }))
    minute_metrics = list(object({
      enabled               = bool
      version               = string
      include_apis          = string
      retention_policy_days = string
    }))
    hour_metrics = list(object({
      enabled               = bool
      version               = string
      include_apis          = string
      retention_policy_days = string
    }))
  }))
  description = "Queue properties block"
  default     = {}
}

## storage lifecycle variables


variable "lifcecycle_rules" {
  description = "rule supports the following: name - (Required) A rule name can contain any combination of alpha numeric characters. Rule name is case-sensitive. It must be unique within a policy. enabled - (Required) Boolean to specify whether the rule is enabled. prefix_match -  prefix of container names, an array of strings for prefixes to be matched. blob_types - An array of predefined values. Only blockBlob is supported. tier_to_cool_after_days_since_modification_greater_than - The age in days after last modification to tier blobs to cool storage. Supports blob currently at Hot tier. Must be at least 0. tier_to_archive_after_days_since_modification_greater_than - The age in days after last modification to tier blobs to archive storage. Supports blob currently at Hot or Cool tier. Must be at least 0. delete_after_days_since_modification_greater_than - The age in days after last modification to delete the blob. Must be at least 0. delete_after_days_since_creation_greater_than - The age in days after create to delete the snaphot. Must be at least 0."
  type = list(object({
    name                                                       = string
    enabled                                                    = bool
    prefix_match                                               = list(string)
    blob_types                                                 = list(string)
    tier_to_cool_after_days_since_modification_greater_than    = number
    tier_to_archive_after_days_since_modification_greater_than = number
    delete_after_days_since_modification_greater_than          = number
    delete_snapshot_after_days_since_creation_greater_than     = number
  }))
  default = []
}

variable "add_lifecycle_rules" {
  description = "to add lifcecycle rules"
  type        = bool
}

## storage container vars
variable "sa_containers" {
  description = "create container along with storage account"
  type        = any
  default     = null
}
variable "storage_container_name" {
  description = "name of the storage container"
  type        = string
  default     = null
}

## Storage Advanced Threat Protection vars
variable "enable_advanced_threat_protection" {
  description = "Boolean flag which controls if advanced threat protection is enabled."
  type        = bool
}

## Storage account with cmk

variable "cmk_enable_storage_accounts" {
  description = "Boolean flag which controls if cmk for storage account is enabled."
  type        = bool
}

variable "key_vault_id" {
  description = "The ID of the Key Vault. Changing this forces a new resource to be created"
  type        = string
  default     = ""
}

variable "key_vault_key_name" {
  description = "The name of Key Vault Key"
  type        = string
  default     = ""
}

variable "key_vault_key_version" {
  description = "The version of Key Vault Key. Remove or omit this argument to enable Automatic Key Rotation"
  type        = string
  default     = null
}
