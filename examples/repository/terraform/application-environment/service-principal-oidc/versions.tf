terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.53.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

provider "azurerm" {
  features {}
}
provider "azuread" {
}