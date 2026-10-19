output "bastion-resource" {
    value = azurerm_bastion_host.private["bastion1"].id
  
}