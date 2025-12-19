public_ips = {
  frontend = {
    resource_group_name = "rg-production"
    location            = "East US"
    pip_name              = "pip-frontend-001"
    allocation_method = "Static"
    sku               = ""
    ip_version        = "IPv4"
    domain_name_label = "frontend-app"
    tags = {
      Env = "Dev"
    }
    }
    backend = {
    resource_group_name = "rg-development"
    location            = "East US"
    pip_name              = "pip-backend-001"
    allocation_method = ""
    sku               = "standard"
    ip_version        = "IPv4"
    tags = {
      Env = "Dev"
    }
  }
}
