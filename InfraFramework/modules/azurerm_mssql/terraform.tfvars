sql_servers = {
  sqlserver1 = {
    rg_name      = "sql-rg-1"
    location     = "East US"
    server_name  = "infrasqlserver1"
    version      = "12.0"
    admin_login  = "sqladminuser1"
    admin_password = "P@ssword1234!"
    server_id    = "infrasqlserver1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"   
    license_type = "LicenseIncluded"
    max_size_gb  = 10
    read_scale   = "false"
    sku_name     = "S0"
    sql_db_name  = "infradb1"
  }

  sqlserver2 = {
    rg_name      = "sql-rg-2"
    location     = "East US"
    server_name  = "infrasqlserver2"
    version      = "12.0"
    admin_login  = "sqladminuser2"
    admin_password = "P@ssword5678!"
    server_id    = "infrasqlserver2"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 10
    read_scale   = "true"
    sku_name     = "S0"
    sql_db_name  = "infradb2"
  }
}

   
