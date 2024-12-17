resource "random_string" "backend_suffix" {
  length  = 8
  upper   = false
  special = false
}

module "backend" {

  source = "../../modules/azure-dual-backend-core"

  providers = {
    azurerm.nonprod = azurerm.nonprod
    azurerm.prod    = azurerm.prod
  }

  name     = "tf${random_string.backend_suffix.result}"
  location = var.location

}

module "app" {

  source = "../../modules/azure-dual-backend-app"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.github_repository_name
  repository_description = var.github_repository_description
  repository_visibility  = var.github_repository_visibility
  terraform_version      = var.terraform_version

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
