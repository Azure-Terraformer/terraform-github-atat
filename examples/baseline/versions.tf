
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
        azurerm.dev,
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
