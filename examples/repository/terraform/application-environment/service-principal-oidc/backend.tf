

provider "azurerm" {
  alias           = "dev"
  subscription_id = var.environments["dev"]

  features {}
}

provider "azurerm" {
  alias           = "prod"
  subscription_id = var.environments["prod"]

  features {}
}

module "backend_dev" {

  providers = {
    azurerm = azurerm.dev
  }

  source   = "markti/azure-terraformer/azurerm//modules/terraform/backend/baseline"
  version  = "1.0.16"
  location = "westus3"
}

module "backend_prod" {

  providers = {
    azurerm = azurerm.prod
  }

  source   = "markti/azure-terraformer/azurerm//modules/terraform/backend/baseline"
  version  = "1.0.16"
  location = "westus3"
}

locals {
  backends = {
    dev  = module.backend_dev.backend_config,
    prod = module.backend_prod.backend_config
  }
}