variable "rg-name" {
  type = map(object({
    name     = string
    location = string
  }))

}

variable "vnet-name" {
  type = map(object({
    name     = string
    location = string
    resource_group_name = string
    address_space = list(string)
    
  }))

}

variable "strg-name" {
  type = map(object({
    name     = string
    location = string
    resource_group_name = string
    account_tier = string
    account_replication_type = string
  }))


}

