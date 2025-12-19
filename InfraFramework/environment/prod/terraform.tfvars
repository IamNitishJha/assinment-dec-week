vnets = {
  vnet1 = {
    vent_name               = "vnet-production"
    address_space           = ["10.0.0.0/16"]
    location                = "East US"
    resource_group_name     = "rg-production"
    subnet_name             = "subnet-production"
    subnet_address_prefixes = ["10.0.1.0/24"]
  }
  vnet2 = {
    vent_name               = "vnet-development"
    address_space           = ["10.1.0.0/16"]
    location                = "East US"
    resource_group_name     = "rg-development"
    subnet_name             = "subnet-development"
    subnet_address_prefixes = ["10.1.1.0/24"]
  }
}


