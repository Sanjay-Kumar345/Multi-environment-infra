rg-name = {
  rg1 = {
    name     = "infra-rg-prod"
    location = "East US"
  }
}

strg-name = {
  strg1 = {
    name     = "infrastrgacc-prod"
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"
    resource_group_name = "infra-rg-prod"
  }
}

vnet-name = {
  vnet1 = {
    name                = "infravnet-prod"
    location            = "East US"
    resource_group_name = "infra-rg-prod"
    address_space       = ["10.40.0.0/16"]
  }
}