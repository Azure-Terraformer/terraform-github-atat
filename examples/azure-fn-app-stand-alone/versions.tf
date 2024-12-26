
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.10.0"
      configuration_aliases = [
        azurerm.nonprod,
        azurerm.prod,
      ]
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = var.github_organization
}
# LAME
provider "azurerm" {
  subscription_id = var.azure_nonprod_subscription

  features {}
}
# DEV Subscription
provider "azurerm" {
  alias           = "nonprod"
  subscription_id = var.azure_nonprod_subscription

  features {}
}
# PROD Subscription
provider "azurerm" {
  alias           = "prod"
  subscription_id = var.azure_prod_subscription

  features {}
}
