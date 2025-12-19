
resource "azurerm_resource_group" "rg" {
  for_each = var.vnets
  name     = each.value.resource_group_name
  location = each.value.location
}

resource "azurerm_virtual_network" "vent" {
  for_each            = var.vnets
  name                = each.value.vent_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  depends_on          = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "snet" {
  for_each             = var.vnets
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vent_name
  address_prefixes     = each.value.subnet_address_prefixes
  depends_on           = [azurerm_virtual_network.vent]

}



