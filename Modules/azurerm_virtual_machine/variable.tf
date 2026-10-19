variable "vm-name" {
  type = map(object({
    name     = string
    location = string
    subnet_name = string
    virtual_network_name = string
    resource_group_name = string
    vm_size = string
    admin_username = string
    admin_password = string
  }))
}