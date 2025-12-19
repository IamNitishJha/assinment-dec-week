# 🔹 Create multiple Resource Groups dynamically
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name        = each.value.name
  location    = each.value.location
  managed_by  = lookup(each.value, "managed_by", null)
  tags        = merge(
    {
      Environment = lookup(each.value, "environment", "dev")
      Owner       = "Terraform"
    },
    lookup(each.value, "tags", {})
  )
}
