module "application_environment" {
  source = "../../"

  providers = {
    azurerm.dev  = azurerm.dev
    azurerm.prod = azurerm.prod
  }

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
      subscription_id = var.azure_dev_subscription
      branch_name     = "develop"
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
    }
  }

}
