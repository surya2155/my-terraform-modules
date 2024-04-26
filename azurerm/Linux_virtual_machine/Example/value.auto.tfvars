linux_hostname       = "test-vm"
admin_username       = "azureadminuser"
virtual_machine_size = "Standard_D2s_v3"
os_disk = [
  {
    name                 = "test-vm-osdisk1"
    caching              = "ReadWrite"
    disk_size_gb         = 50
    storage_account_type = "Premium_LRS"
    custom_data          = null
  }
]

vm_image = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04-LTS"
  version   = "latest"
}

linux_vm_tags = {
  Name        = "terraform-demo-vent"
  Environment = "Dev"

}