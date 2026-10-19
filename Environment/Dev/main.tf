module "resource-group" {
  source  = "../../Modules/azurerm-resource-group"
  rg-name = var.rg-name

}

module "strg-resource" {
  source     = "../../Modules/azurerm-strg-account"
  strg-name  = var.strg-name
  depends_on = [module.resource-group]
}

module "vnet-resource" {
  source     = "../../Modules/azurerm-vnet"
  vnet-name  = var.vnet-name
  depends_on = [module.resource-group]
}

module "subnet-resource" {
  source      = "../../Modules/azurerm-subnet"
  subnet-name = var.subnet-name
  depends_on  = [module.vnet-resource]
}

module "bastion-resource" {
  source        = "../../Modules/azurerm_bastion"
  bastion-name  = var.bastion-name
  depends_on    = [module.subnet-resource]
}


module "vm-resource" {
  source     = "../../Modules/azurerm_virtual_machine"
  vm-name    = var.vm-name
  depends_on = [module.subnet-resource]
}