module "mono-rg" {
    source = "./module/azurerm_resource_group"

}

module "mono_staccount" {
    depends_on = [ module.mono-rg ]
  source = "./module/azurerm_storage_account"
}

module "vnet" {
    depends_on = [ module.mono-rg ]
  source = "./module/azurerm_virtual_network"
}

module "subnet" {
    depends_on = [ module.vnet ]
  source = "./module/azurerm_subnet"
}

module "pip" {
  source = "./module/azurerm_puplic_ip"
}
module "vm" {
    depends_on = [ module.subnet, module.pip ]
  source = "./module/azurerm_vitual_machine"
}
# module "nsg" {
#     depends_on = [ module.subnet ]
#   source = "./module/azurerm_network_security_group"
# }

module "azurerm_vitual_machine" {
    depends_on = [ module.subnet, module.pip ]
    source = "./module/azurerm_vitual_machine"
}

