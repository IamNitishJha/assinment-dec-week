
# Map of public IPs to create (key = logical name)
variable "public_ips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string           # resource group where to create the public IP
    location            = string           # actual resource name
    allocation_method   = string          # "Static" or "Dynamic"
    sku                 = string           # "Basic" or "Standard"
    sku_tier            = optional(string) # optional: "Global"
    ip_version          = optional(string) # "IPv4" | "IPv6"
    zones               = optional(list(string))
    idle_timeout        = optional(number)
    domain_name_label   = optional(string) # if provided will create DNS label
    ip_tags             = optional(map(string))
    tags                = optional(map(string))
  }))
  description = "Map of public IPs to create with attributes"
  default     = {}
}
