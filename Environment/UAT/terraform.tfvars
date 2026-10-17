rg-name = {
  rg1 = {
    name     = "infra-rg-UAT"
    location = "East US"
  }
}

strg-name = {
  strg1 = {
    name     = "infrastrgacc-UAT"
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"
    resource_group_name = "infra-rg-UAT"
  }
}

vnet-name = {
  vnet1 = {
    name                = "infravnet-UAT"
    location            = "East US"
    resource_group_name = "infra-rg"
    address_space       = ["10.30.0.0/16"]
  }
}