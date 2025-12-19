variable "vnets" {
  type = map(object({
    vent_name               = string
    address_space           = list(string)
    location                = string
    resource_group_name     = string
    subnet_name             = string
    subnet_address_prefixes = list(string)
  }))
}

