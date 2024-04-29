# -
# - Azure linux virtual machine
# -
resource "azurerm_linux_virtual_machine" "az_linux_virtual_machine" {
  name                  = var.linux_vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.virtual_machine_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.network_interface_ids
  provision_vm_agent    = var.provision_vm_agent
  source_image_id       = var.source_image_id != null ? var.source_image_id : null
  tags                  = var.linux_vm_tags

  allow_extension_operations      = var.allow_extension_operations
  availability_set_id             = var.availability_set_id
  dedicated_host_id               = var.dedicated_host_id
  computer_name                   = var.computer_name == null ? var.linux_vm_name : null
  custom_data                     = var.custom_data
  disable_password_authentication = var.disable_password_authentication
  encryption_at_host_enabled      = var.encryption_at_host_enabled
  eviction_policy                 = var.eviction_policy == "Deallocate" ? var.eviction_policy : null
  max_bid_price                   = var.eviction_policy == "Deallocate" ? var.max_bid_price : null
  priority                        = var.priority == "Spot" ? var.priority : null
  proximity_placement_group_id    = var.proximity_placement_group_id
  virtual_machine_scale_set_id    = var.virtual_machine_scale_set_id
  zone                            = var.availability_set_id == null ? var.zones : null

  # secret config block
  dynamic "secret" {
    for_each = var.secret
    content {
      key_vault_id = lookup(secret.value, "key_vault_id", null)
      certificate {
        url = lookup(secret.value, "url", null)
      }
    }
  }

  # os disk config block
  dynamic "os_disk" {
    for_each = var.os_disk
    content {
      name                      = lookup(os_disk.value, "name", null)
      disk_size_gb              = lookup(os_disk.value, "disk_size_gb", 30)
      storage_account_type      = lookup(os_disk.value, "storage_account_type", "Premium_LRS")
      caching                   = lookup(os_disk.value, "caching", "ReadWrite")
      disk_encryption_set_id    = var.create_disk_encryption_set == true ? azurerm_disk_encryption_set.az_disk_encryption_set[0].id : null
      write_accelerator_enabled = lookup(os_disk.value, "write_accelerator_enabled", null)
    }
  }

  # additional capabilities config block
  dynamic "additional_capabilities" {
    for_each = var.enable_ultra_ssd
    content {
      ultra_ssd_enabled = lookup(additional_capabilities.value, "ultra_ssd_enabled", null)
    }
  }

  # boot diagnostics config block
  dynamic "boot_diagnostics" {
    for_each = var.diagnostics_storage_account_name
    content {
      storage_account_uri = lookup(boot_diagnostics.value, "storage_account_uri", null)
    }
  }

  # admin ssh key config block
  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key
    content {
      username   = var.admin_username
      public_key = lookup(admin_ssh_key.value, "public_key", null)
    }
  }

  # source image reference config block
  dynamic "source_image_reference" {
    for_each = var.source_image_reference
    content {
      offer     = lookup(source_image_reference.value, "offer", null)
      publisher = lookup(source_image_reference.value, "publisher", null)
      sku       = lookup(source_image_reference.value, "sku", null)
      version   = lookup(source_image_reference.value, "version", null)
    }
  }



  # plan config block
  dynamic "plan" {
    for_each = var.plan
    content {
      name      = lookup(plan.value, "name", null)
      product   = lookup(plan.value, "product", null)
      publisher = lookup(plan.value, "publisher", null)
    }
  }

  # identity config block
  dynamic "identity" {
    for_each = var.identity

    content {
      type         = lookup(identity.value, "type", null)
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }

  depends_on = [azurerm_disk_encryption_set.az_disk_encryption_set, azurerm_key_vault_access_policy.az_key_vault_access_cmk_policy]

  lifecycle {
    ignore_changes = [
      admin_password
      #admin_ssh_key["public_key"]
    ]
  }
}


# -
# - Enable Disk Encryption Set with CMK
# -

locals {
  key_permissions    = ["Get", "WrapKey", "UnwrapKey"]
  secret_permissions = ["Get", "Set", "List"]
}
# -
# - Adding Access Policies for Disk Encryption Set 
# -
resource "azurerm_disk_encryption_set" "az_disk_encryption_set" {
  count               = var.create_disk_encryption_set ? 1 : 0
  name                = "${var.linux_vm_name}-cmk"
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_key_id    = var.key_vault_key_id

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [key_vault_key_id]
  }

  tags = var.linux_vm_tags
}

# -
# - Adding Access Policies for Disk Encryption Set 
# -
resource "azurerm_key_vault_access_policy" "az_key_vault_access_cmk_policy" {
  count              = var.create_disk_encryption_set ? 1 : 0
  key_vault_id       = var.key_vault_id
  tenant_id          = azurerm_disk_encryption_set.az_disk_encryption_set[0].identity[0].tenant_id
  object_id          = azurerm_disk_encryption_set.az_disk_encryption_set[0].identity[0].principal_id
  key_permissions    = local.key_permissions
  secret_permissions = local.secret_permissions
}

# -
# - Enabling Azure Monitor Dependency virtual machine extension for Azure Linux VM 
# -
# resource "azurerm_virtual_machine_extension" "az_log_analytics_dep_agent" {
#   count                      = var.install_loganalytics_dependency_agent ? 1 : 0
#   name                       = var.loganalytics_dep_agent_name
#   virtual_machine_id         = azurerm_linux_virtual_machine.az_linux_virtual_machine.id
#   publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
#   type                       = "DependencyAgentLinux"
#   type_handler_version       = var.lag_dep_type_handler_version
#   auto_upgrade_minor_version = true
#   settings                   = <<SETTINGS
#     {
#       "workspaceId": "${var.law_workspace_id}"       
#     }
#   SETTINGS

#   protected_settings = <<SETTINGS
#     {
#       "workspaceKey": "${var.law_workspace_key}"
#     }
#   SETTINGS
#   depends_on         = [azurerm_linux_virtual_machine.az_linux_virtual_machine]
#   tags               = var.linux_vm_tags
# }

# -
# - Enable Log Analytics Diagnostics and Logs on Azure Linux VM
# -
# resource "azurerm_virtual_machine_extension" "az_log_analytics_agent" {
#   count                      = var.install_loganalytics_agent ? 1 : 0
#   name                       = var.loganalytics_agent_name
#   virtual_machine_id         = azurerm_linux_virtual_machine.az_linux_virtual_machine.id
#   publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
#   type                       = "OmsAgentForLinux"
#   type_handler_version       = var.lag_type_handler_version
#   auto_upgrade_minor_version = true

#   settings = <<SETTINGS
#      {
#        "workspaceId": "${var.law_workspace_id}"       
#      }
#    SETTINGS

#   protected_settings = <<SETTINGS
#      {
#        "workspaceKey": "${var.law_workspace_key}"
#      }
#    SETTINGS

#   tags = var.linux_vm_tags

#   depends_on = [azurerm_linux_virtual_machine.az_linux_virtual_machine, azurerm_virtual_machine_extension.az_log_analytics_dep_agent]
# }