module "backend" {

  source = "../../modules/azure-dual-backend-core"

  providers = {
    azurerm.nonprod = azurerm.nonprod
    azurerm.prod    = azurerm.prod
  }

  name     = var.name
  location = var.location

}
