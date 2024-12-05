# Configure the GitHub Provider
provider "github" {
  owner = var.github_organization
}
provider "azuread" {}
# LAME
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000000"

  features {}
}
# DEV Subscription
provider "azurerm" {
  alias           = "dev"
  subscription_id = "00000000-0000-0000-0000-000000000000"

  features {}
}
# PROD Subscription
provider "azurerm" {
  alias           = "prod"
  subscription_id = "00000000-0000-0000-0000-000000000000"

  features {}
}
