variable "vms" {
  type = map(object({
    rg_name                      = string
    location                     = string
    vent                         = string
    snet                         = string
    nic                          = string
    pip_name                     = string
    vm_name                      = string
    vm_size                      = string
    vm_username                  = string
    vm_password                  = string
    os_disk_caching              = string
    kv_name                      = string
    rg_key_rg_name               = string
    os_disk_storage_account_type = string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
