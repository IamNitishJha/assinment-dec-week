resource "azurerm_resource_group" "mono-rg" {
  for_each = var.rg
  name     = each.value.rg_name
  location = each.value.location
}


