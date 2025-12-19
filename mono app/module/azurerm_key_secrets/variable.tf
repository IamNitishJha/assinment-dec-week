variable "key_sec" {
  type = map(object({
    name          = string
    value         = string
    key_vault_id  = string
    content_type  = optional(string)
    tags          = optional(map(string))
  }))
}


