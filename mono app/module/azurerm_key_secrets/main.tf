resource "azurerm_key_secret" "name" {
    for_each            = var.key_sec
    name                = each.value.name
    value               = each.value.value
    key_vault_id        = each.value.key_vault_id
    content_type       = lookup(each.value, "content_type", null)
    tags               = lookup(each.value, "tags", null)
}



