variable "resource_groups" {
  description = "Map of Azure Resource Groups to be created"
  type = map(object({
    name        = string
    location    = string
    managed_by  = optional(string)
    environment = optional(string)
    tags        = optional(map(string))
  }))
}
