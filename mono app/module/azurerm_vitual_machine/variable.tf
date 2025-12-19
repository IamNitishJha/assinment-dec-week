variable "vms" {
  type = map(object({
    vm_name             = string
    nic_name            = string
    location            = string
    resource_group_name = string
    network_interface_ids = list(string)
    vm_size             = string
    os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      public_ip_address_id          = string
    })
  }))
}