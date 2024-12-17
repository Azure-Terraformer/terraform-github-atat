module "backend_nonprod" {

  providers = {
    azurerm = azurerm.nonprod
  }

  source  = "Azure-Terraformer/terraform-backend/azurerm"
  version = "1.0.4"

  name     = var.name
  location = var.location
  tags = {
    application_name = var.name
    environment_name = "nonprod"
  }

}

module "backend_prod" {

  providers = {
    azurerm = azurerm.prod
  }

  source  = "Azure-Terraformer/terraform-backend/azurerm"
  version = "1.0.4"

  name     = var.name
  location = var.location
  tags = {
    application_name = var.name
    environment_name = "prod"
  }

}

locals {
  backends = {
    nonprod = module.backend_nonprod.backend_config,
    prod    = module.backend_prod.backend_config
  }
}
