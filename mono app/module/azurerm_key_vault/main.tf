resource "azurerm_key_vault" "key_vault" {
    for_each            = var.key_vaults
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    sku_name            = each.value.sku_name
    tenant_id           = each.value.tenant_id
    
    tags = each.value.tags
}


