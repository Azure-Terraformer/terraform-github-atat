module "backend_dev" {

  providers = {
    azurerm = azurerm.dev
  }

  source   = "Azure-Terraformer/terraform-backend/azurerm"
  version  = "1.0.2"
  location = "westus3"

}

module "backend_prod" {

  providers = {
    azurerm = azurerm.prod
  }

  source   = "Azure-Terraformer/terraform-backend/azurerm"
  version  = "1.0.2"
  location = "westus3"

}

locals {
  backends = {
    dev  = module.backend_dev.backend_config,
    prod = module.backend_prod.backend_config
  }
}
