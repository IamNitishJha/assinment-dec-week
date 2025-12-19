output "public_ip_addresses" {
  description = "Map of public IP addresses created"
  value = { for k, v in azurerm_public_ip.pips : k => {
      id      = v.id
      name    = v.name
      ip      = try(v.ip_address, "")
      fqdn    = try(v.fqdn, "")
      location= v.location
    }
  }
}
