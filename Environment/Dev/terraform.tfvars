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