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

variable "subnet-name" {
  type = map(object({
    name = string
    resrource_group_name = string
    virtual_network_name = string
    address_prefixes = list(string)
  }))

}

variable "bastion-name" {
    type = map(object({
        name = string
        resrource_group_name = string
        virtual_network_name = string
        location = string
        public_ip_name = string
    }))
  
}


variable "vm-name" {
  type = map(object({
    name     = string
    location = string
    subnet_name = string
    resource_group_name = string
    virtual_network_name = string
    vm_size = string
    admin_username = string
    admin_password = string
  }))
}