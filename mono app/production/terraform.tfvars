             
 vms = {
    vm1 = {
      vm_name                = "monolitikh-vm1"
      location               = module.mono-rg.location
      resource_group_name    = module.mono-rg.resource_group_name
      network_interface_ids  = [module.nic.nic["vm1"].id]
      vm_size                = "Standard_B1s"
      os_disk = {
        name              = "monolitikh-os-disk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
      }
      image_reference = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }
    }
  }
