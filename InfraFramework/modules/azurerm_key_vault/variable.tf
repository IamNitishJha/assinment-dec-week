variable "key_vault" {
  type = map(object({
    rg_name  = string
    location = string
    key_name = string
  }))
} 

