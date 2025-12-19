# Data source to fetch resource group details  
data "azurerm_resource_group" "rg" {
  for_each = var.public_ips
  name = each.value.resource_group_name
}

# Public IP resource
resource "azurerm_public_ip" "pips" {
  for_each            = var.public_ips

  name                = each.value.pip_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  location            = each.value.location
  allocation_method   = contains(["Static", "Dynamic"], upper(each.value.allocation_method)) ? each.value.allocation_method : "Static"
  sku                 = contains(["Basic", "Standard"], upper(each.value.sku)) ? each.value.sku : "standard"
  ip_version          = lookup(each.value, "ip_version", "IPv4")

  # ✅ Correct usage for domain name (works with both Basic/Standard)
  domain_name_label   = lookup(each.value, "domain_name_label", null)

  idle_timeout_in_minutes = lookup(each.value, "idle_timeout", null)

  zones = try(each.value.zones, null)
  ip_tags = lookup(each.value, "ip_tags", null)
  sku_tier = (each.value.sku == "Standard" && contains(keys(each.value), "sku_tier")) ? lookup(each.value, "sku_tier", null) : null

  # ✅ Removed routing_preference — unsupported in new provider
  # (If needed, specify IP type in Azure manually)

  tags = lookup(each.value, "tags", {})
}
