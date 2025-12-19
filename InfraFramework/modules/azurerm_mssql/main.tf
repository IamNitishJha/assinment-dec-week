variable "sql_servers" {}

resource "azurerm_resource_group" "rg" {
  for_each = var.sql_servers
  name     = each.value.rg_name
  location = each.value.location
}


resource "azurerm_mssql_server" "sql_servers" {
  for_each                     = var.sql_servers
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_database" "sql_db" {
  for_each            = var.sql_servers
  name                = each.value.sql_db_name  
  server_id           = azurerm_mssql_server.sql_servers[each.key].id
  collation           = each.value.collation
  license_type        = each.value.license_type
  max_size_gb         = each.value.max_size_gb
  read_scale          = each.value.read_scale
  sku_name            = each.value.sku_name
  zone_redundant      = true
  tags = {
    environment = "production"
  }
}
