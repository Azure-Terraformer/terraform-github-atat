module "application_environment" {
  source = "../../"

  providers = {
    azurerm.dev  = azurerm.dev
    azurerm.prod = azurerm.prod
  }

  github_organization = var.github_organization
  repository_name     = "atat-demo"

  commit_user = {
    name  = "YOU"
    email = "you@me.com"
  }

  environments = {
    dev = {
      subscription_id = "00000000-0000-0000-0000-000000000000"
      branch_name     = "develop"
    }
    prod = {
      subscription_id = "00000000-0000-0000-0000-000000000000"
      branch_name     = "main"
    }
  }

}
