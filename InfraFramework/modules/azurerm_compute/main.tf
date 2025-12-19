
data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "snet" {
  for_each             = var.vms
  name                 = each.value.snet
  virtual_network_name = each.value.vent
  resource_group_name  = each.value.rg_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.rg_key_rg_name
} 

data "azurerm_key_vault_secret" "kv_secret" {
  for_each            = var.vms
  name                = each.value.vm_username
  key_vault_id       = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "kv_password" {
  for_each            = var.vms
  name                = each.value.vm_password
  key_vault_id       = data.azurerm_key_vault.kv[each.key].id
  
}


resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.rg_name
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]
  size                         = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.kv_secret[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.kv_password[each.key].value
  disable_password_authentication = false

  source_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
   os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }
}


