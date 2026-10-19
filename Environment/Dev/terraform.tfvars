rg-name = {
  rg1 = {
    name     = "infra-rg"
    location = "East US"
  }
}

strg-name = {
  strg1 = {
    name     = "infrastrgacc"
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"
    resource_group_name = "infra-rg"
  }
}

vnet-name = {
  vnet1 = {
    name                = "infravnet"
    location            = "East US"
    resource_group_name = "infra-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet-name = {
  subnet1 = {
    name                 = "frontend-subnet"
    resrource_group_name  = "infra-rg"
    virtual_network_name = "infravnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "AzureBastionSubnet"
    resrource_group_name  = "infra-rg"
    virtual_network_name = "infravnet"
    address_prefixes     = ["10.0.2.0/24"]
  } 
}

bastion-name = {
  bastion1 = {
    name                 = "infrabastion"
    resrource_group_name  = "infra-rg"
    virtual_network_name = "infravnet"
    location             = "East US"
    public_ip_name       = "public-ip"
  }
}

vm-name = {
  vm1 = {
    name                 = "frontend-vm"
    subnet_name          = "frontend-subnet"
    location             = "East US"
    resource_group_name  = "infra-rg"
    vm_size              = "Standard_D2als_v6"
    virtual_network_name = "infravnet"
    admin_username       = ""
    admin_password       = ""
  }
}