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