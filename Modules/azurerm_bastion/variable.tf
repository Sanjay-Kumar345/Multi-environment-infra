variable "bastion-name" {
    type = map(object({
        name = string
        resrource_group_name = string
        virtual_network_name = string
        location = string
        public_ip_name = string
    }))
  
}