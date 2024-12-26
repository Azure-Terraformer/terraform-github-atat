resource "random_string" "backend_suffix" {
  length  = 8
  upper   = false
  special = false
}

module "backend" {

  source = "../../modules/azure-dual-backend"

  providers = {
    azurerm.nonprod = azurerm.nonprod
    azurerm.prod    = azurerm.prod
  }

  name     = "tf${random_string.backend_suffix.result}"
  location = var.location

}

module "core" {

  source = "../../modules/azure-fn-core"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.repository_name
  repository_description = var.repository_description
  repository_visibility  = var.repository_visibility
  terraform_version      = var.terraform_version
  primary_location       = "westus3"
  sku_name               = "Y1"
  os_type                = "Windows"
  retention_in_days      = 30

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "develop"
      backend         = module.backend.nonprod
    }
    test = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "release"
      backend         = module.backend.nonprod
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      backend         = module.backend.prod
    }
  }

}

module "app" {

  source = "../../modules/azure-fn-app"

  application_name       = "${var.application_name}-fn"
  github_organization    = var.github_organization
  repository_name        = var.repository_name
  repository_description = var.repository_description
  repository_visibility  = var.repository_visibility
  terraform_version      = var.terraform_version
  primary_location       = "eastus2"
  os_type                = "Windows"
  core_name              = var.application_name
  root_namespace         = "ATAT.Core"

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "develop"
      reviewing_teams = []
      reviewing_users = []
      backend         = module.backend.nonprod
    }
    test = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "release"
      reviewing_teams = []
      reviewing_users = []
      backend         = module.backend.nonprod
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      reviewing_teams = []
      reviewing_users = []
      backend         = module.backend.prod
    }
  }

}
