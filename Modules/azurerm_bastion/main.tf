data "azurerm_subnet" "datasubnet" {
  for_each = var.bastion-name
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resrource_group_name
}

output "subnet_id" {
 
  value = {
    for key, subnet in data.azurerm_subnet.datasubnet :
    key => subnet.id
  }
}


resource "azurerm_public_ip" "pip" {
  for_each = var.bastion-name
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resrource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "private" {
  for_each = var.bastion-name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resrource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}