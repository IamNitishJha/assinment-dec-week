resource_groups = {
  rg1 = {
    name        = "rg-network-demo"
    location    = "Central India"
    environment = "Dev"
    tags = {
      Project = "AI Infra"
      CostCenter = "1001"
    }
  }

  rg2 = {
    name        = "rg-apps-demo"
    location    = "East US"
    managed_by  = "DevOps Team"
    environment = "Stage"
    tags = {
      Project = "Todo Micro App"
      Owner   = "Har Har Mahadev"
    }
  }
}



