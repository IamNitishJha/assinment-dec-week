vms = {
  vm1 = {
    rg_name                      = "rg-production"
    location                     = "East US"
    vent                         = "vnet-production"
    snet                         = "subnet-production"
    nic                          = "nic-frontend-001"
    pip_name                     = "pip-frontend-001"
    vm_name                      = "vm-frontend-001"
    vm_size                      = "Standard_DS1_v2"
    vm_password                  = "vm-password"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    kv_name                      = "generic-key-vault21"
    rg_key_rg_name               = "resource_backend_block"
    vm_username                  = "generic-key-vault21"
    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

    vm2 = {
      rg_name                = "rg-development"
      location               = "East US"
      vent                   = "vnet-development"
      snet                   = "subnet-development"
      nic                    = "nic-backend-001"
      pip_name               = "pip-backend-001"
      vm_name                = "vm-backend-001"
      vm_size                = "Standard_B1s"
       kv_name                    = "generic-key-vault21"
  rg_key_rg_name = "resource_backend_block"
  vm_username    = "generic-key-vault21"  
      vm_password         = "vm-password"
      os_disk_caching              = "ReadWrite"
      os_disk_storage_account_type = "Standard_LRS"
      storage_image_reference = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2019-Datacenter"
        version   = "latest"
      }
    }
}











