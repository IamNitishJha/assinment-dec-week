resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = each.value.ip_configuration.subnet_id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = each.value.ip_configuration.public_ip_address_id
  }

  tags = each.value.tags
  
}


resource "azurerm_virtual_machine" "virtual_machines" {
  for_each            = var.vms
  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  network_interface_ids = each.value.network_interface_ids
  vm_size             = each.value.vm_size

  storage_os_disk {
    name              = each.value.os_disk.name
    caching           = each.value.os_disk.caching
    create_option     = each.value.os_disk.create_option
    managed_disk_type = each.value.os_disk.managed_disk_type
  }

  storage_image_reference {
    publisher = each.value.image_reference.publisher
    offer     = each.value.image_reference.offer
    sku       = each.value.image_reference.sku
    version   = each.value.image_reference.version
  }
}



