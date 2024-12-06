module "backend_dev" {

  providers = {
    azurerm = azurerm.dev
  }

  source   = "Azure-Terraformer/terraform-backend/azurerm"
  version  = "1.0.3"
  location = "westus3"
  tags = {
    application_name = var.application_name
    environment_name = "dev"
  }

}

module "backend_prod" {

  providers = {
    azurerm = azurerm.prod
  }

  source   = "Azure-Terraformer/terraform-backend/azurerm"
  version  = "1.0.3"
  location = "westus3"
  tags = {
    application_name = var.application_name
    environment_name = "prod"
  }

}

locals {
  backends = {
    dev  = module.backend_dev.backend_config,
    prod = module.backend_prod.backend_config
  }
}
