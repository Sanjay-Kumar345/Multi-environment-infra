

data "azurerm_key_vault" "kv" {
  name                = "infratestvault67"
  resource_group_name = "test-rg"
}

    data "azurerm_key_vault_secret" "password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}



data "azurerm_subnet" "infrasubnet" {
    for_each = var.vm-name
 name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

  

}

output "subnet_id" {
 
  value = {
    for key, subnet in data.azurerm_subnet.infrasubnet :
    key => subnet.id
  }
}

resource "azurerm_network_interface" "main" {
  for_each            = var.vm-name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.infrasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
    for_each = var.vm-name
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = each.value.vm_size 

  
   
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = data.azurerm_key_vault_secret.username.value
    admin_password = data.azurerm_key_vault_secret.password.value
    
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  }
