# Configure the GitHub Provider
provider "github" {
  owner = var.github_organization
}
provider "azuread" {}
# LAME
provider "azurerm" {
  subscription_id = var.azure_dev_subscription

  features {}
}
# DEV Subscription
provider "azurerm" {
  alias           = "dev"
  subscription_id = var.azure_dev_subscription

  features {}
}
# PROD Subscription
provider "azurerm" {
  alias           = "prod"
  subscription_id = var.azure_prod_subscription

  features {}
}
